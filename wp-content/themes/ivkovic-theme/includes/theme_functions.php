<?php 

if( function_exists('acf_add_options_page') ) {
	
	acf_add_options_page(array(
		'page_title' 	=> 'Theme General Settings',
		'menu_title'	=> 'Theme Settings',
		'menu_slug' 	=> 'theme-general-settings',
		'capability'	=> 'edit_posts',
		'redirect'		=> false
    ));
	
}

/**
 * Displaying a background image if set
 *
 * @param int,string $image
 * @param boolean $echo
 * @return string
 */
function bg( $image, $echo = true, $size = 'full' ){

    $content = $image_url = $image_alt = '';
	if( is_int($image) ){
        $image_url = wp_get_attachment_image_src($image, $size)[0];
        $image_alt = get_post_meta( $image, '_wp_attachment_image_alt', true);
	}elseif( is_string($image) ){
        $image_url = $image;
        $image_alt = '['.basename($image_url).']';
    }
	
	if( $image_url ){
		$content .= " role='img' aria-label='". $image_alt ."' style='background-image: url($image_url)'";
	}

	if( $echo )
		echo $content;
	else
		return $content;
}

//Output the like button
function get_like_button( $post_id ) {
    $output = '';

	if ( already_liked( $post_id ) ) {
		$icon = 'heart';
	} else {
		$icon = 'heart-empty';
	}

	$output = '<i class="icon-'.$icon.'" data-id="'.$post_id.'"></i>';
	return $output;
}

//Test if the post is already liked
function already_liked( $post_id ) {
    $user_ip = get_user_ip();
    $post_meta_users = get_post_meta( $post_id, "liked_IPs", true );
	
	if( is_array($post_meta_users) ):
		if( in_array( $user_ip, $post_meta_users ) ):
			return true;
		else:
			return false;
		endif;
	else:
		return false;
	endif;
}

//Retrieve IP address
function get_user_ip() {
	if ( isset( $_SERVER['HTTP_CLIENT_IP'] ) && ! empty( $_SERVER['HTTP_CLIENT_IP'] ) ) {
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	} elseif ( isset( $_SERVER['HTTP_X_FORWARDED_FOR'] ) && ! empty( $_SERVER['HTTP_X_FORWARDED_FOR'] ) ) {
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	} else {
		$ip = ( isset( $_SERVER['REMOTE_ADDR'] ) ) ? $_SERVER['REMOTE_ADDR'] : '0.0.0.0';
	}
	$ip = filter_var( $ip, FILTER_VALIDATE_IP );
    $ip = ( $ip === false ) ? '0.0.0.0' : $ip;
	return $ip;
}

//Processes like/unlike
add_action('wp_ajax_ajax_post_like', 'ajax_post_like');
add_action('wp_ajax_nopriv_ajax_post_like', 'ajax_post_like');

function ajax_post_like(){
	$post_id = ( isset( $_REQUEST['post_id'] ) && is_numeric( $_REQUEST['post_id'] ) ) ? $_REQUEST['post_id'] : '';

	if( $post_id ):
		$user_ip = get_user_ip();
		$post_meta_users = get_post_meta( $post_id, "liked_IPs", true );

		if( is_array($post_meta_users) ):
			if( in_array( $user_ip, $post_meta_users ) ):
				if (($key = array_search($user_ip, $post_meta_users)) !== false):
					unset($post_meta_users[$key]);
				endif;
			else:
				$post_meta_users[] = $user_ip;
			endif;
		else:
			$post_meta_users = array($user_ip);
		endif;

		update_post_meta( $post_id, "liked_IPs", $post_meta_users );

	endif;

	die();
}


add_action('wp_ajax_ajax_posts_load_more', 'ajax_posts_load_more');
add_action('wp_ajax_nopriv_ajax_posts_load_more', 'ajax_posts_load_more');

function ajax_posts_load_more(){
	$loaded = ( isset($_REQUEST['loaded']) ) ? $_REQUEST['loaded'] : '';
	$max = ( isset($_REQUEST['max']) ) ? $_REQUEST['max'] : '';

	$args = array(
		'post_type' => 'post',
		'posts_per_page' => 6,
		'offset' => $loaded
	);

	$query = new WP_Query( $args );

	if( $query->have_posts() ):

		while ( $query->have_posts() ) : $query->the_post();
                            
            get_template_part('template-parts/custom/post-item');

        endwhile;

	endif;

	die();
}

add_action('wp_ajax_ajax_posts_archive_load_more', 'ajax_posts_archive_load_more');
add_action('wp_ajax_nopriv_ajax_posts_archive_load_more', 'ajax_posts_archive_load_more');

function ajax_posts_archive_load_more(){
	$loaded = ( isset($_REQUEST['loaded']) ) ? $_REQUEST['loaded'] : '';
	$max = ( isset($_REQUEST['max']) ) ? $_REQUEST['max'] : '';
	$search = ( isset($_REQUEST['search']) ) ? $_REQUEST['search'] : '';

	if( $search ):
		$args = array(
			'post_type' => 'post',
			'posts_per_page' => 6,
			'offset' => $loaded,
			's' => $search
		);
	else:
		$args = array(
			'post_type' => 'post',
			'posts_per_page' => 6,
			'offset' => $loaded
		);
	endif;	

	$query = new WP_Query( $args );

	if( $query->have_posts() ):

		while ( $query->have_posts() ) : $query->the_post();
                            
            get_template_part('template-parts/custom/post-item');

        endwhile;

	endif;

	die();
}

add_action('wp_ajax_ajax_catals_load_more', 'ajax_catals_load_more');
add_action('wp_ajax_nopriv_ajax_catals_load_more', 'ajax_catals_load_more');

function ajax_catals_load_more(){
	$loaded = ( isset($_REQUEST['loaded']) ) ? $_REQUEST['loaded'] : '';
	$max = ( isset($_REQUEST['max']) ) ? $_REQUEST['max'] : '';

	$args = array(
		'post_type' => 'catalogue',
		'posts_per_page' => 6,
		'offset' => $loaded
	);

	$query = new WP_Query( $args );

	if( $query->have_posts() ):

		while ( $query->have_posts() ) : $query->the_post();
                            
			get_template_part('template-parts/custom/catalogue-item');

        endwhile;

	endif;

	die();
}

function pre_get_posts_func($query){
	if ( !is_admin() && $query->is_main_query() ) {
		if ( is_post_type_archive('catalogue') ) {

			$query->set( 'posts_per_page' , 6 );
		}

		if( is_search() ){
			$query->set( 'post_type' , 'post' );
		}
	}
}
add_action( 'pre_get_posts', 'pre_get_posts_func' );


function template_redirect_func() {

	$current_id = get_the_ID();
	$my_acc_id = get_option('woocommerce_myaccount_page_id');
	$is_logged = is_user_logged_in();
	$page_register = get_field('page_register','option');
	//$page_login = get_field('page_login','option');

	if ( is_singular('catalogue') ) {
		wp_redirect( home_url(), 302 );
		exit;
	}

	if ( $current_id == $page_register && $is_logged ) {
		wp_redirect( get_permalink( $my_acc_id ), 302 );
		exit;
	}

	if ( $current_id == $my_acc_id && !$is_logged ) {
		wp_redirect( home_url(), 302 );
		exit;
	}
}
add_action( 'template_redirect', 'template_redirect_func' );

function custom_login(){
	global $pagenow;
	//  URL for the HomePage. You can set this to the URL of any page you wish to redirect to.
	$page_login = get_field('page_login','option');
	//  Redirect to the Homepage, if if it is login page. Make sure it is not called to logout or for lost password feature
	if( 'wp-login.php' == $pagenow && $_GET['action']!="logout" && $_GET['action']!="lostpassword") {
		wp_redirect(get_permalink( $page_login ));
		exit();
	}
}
add_action('init','custom_login');