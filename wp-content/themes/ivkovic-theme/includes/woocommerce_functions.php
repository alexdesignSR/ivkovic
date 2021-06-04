<?php

/**
 * Create Shortcode for WooCommerce Cart Menu Item
 */
add_shortcode ('woo_cart_link', 'woo_cart_link' );

function woo_cart_link() {
	ob_start();
 
    $cart_count = WC()->cart->cart_contents_count; // Set variable for cart item count
    $cart_url = wc_get_cart_url();  // Set Cart URL

    ?>
    
    <a class="cart-contents" href="<?php echo $cart_url; ?>" title="<?php _e('Cart','ruag'); ?>">
        <i class="icon-cart"></i>

        <?php if ( $cart_count > 0 ): ?>

            <span class="cart-contents-count"><?php echo $cart_count; ?></span>

        <?php endif; ?>
    </a>

    <?php return ob_get_clean();
 
}

/**
 * Add AJAX Shortcode when cart contents update
 */
add_filter( 'woocommerce_add_to_cart_fragments', 'woo_cart_link_count' );

function woo_cart_link_count( $fragments ) {
 
    ob_start();
    
    $cart_count = WC()->cart->cart_contents_count;
    $cart_url = wc_get_cart_url();
    
    ?>

    <a class="cart-contents" href="<?php echo $cart_url; ?>" title="<?php _e( 'View your shopping cart' ); ?>">
        <i class="icon-cart"></i>

        <?php if ( $cart_count > 0 ): ?>

            <span class="cart-contents-count"><?php echo $cart_count; ?></span>

        <?php endif; ?>
    </a>

    <?php $fragments['a.cart-contents'] = ob_get_clean();
     
    return $fragments;
}

// Registration form
function ivkovic_validate_register_fields( $username, $email, $errors ) {
 
	if ( empty( $_POST['reg_first_name'] ) ) {
		$errors->add( 'reg_first_name_error', __('Molimo unesite ime.','ivkovic') );
    }
    
    if ( empty( $_POST['reg_last_name'] ) ) {
		$errors->add( 'reg_last_name_error', __('Molimo unesite prezime.','ivkovic') );
    }

    if ( empty( $_POST['reg_address_1'] ) ) {
		$errors->add( 'reg_address_1_error', __('Molimo unesite adresu.','ivkovic') );
    }

    if ( empty( $_POST['reg_city'] ) ) {
		$errors->add( 'reg_city_error', __('Molimo unesite grad.','ivkovic') );
    }

    if ( empty( $_POST['reg_phone'] ) ) {
		$errors->add( 'reg_phone_error', __('Molimo unesite telefon.','ivkovic') );
    }

    if ( empty( $_POST['reg_privacy'] ) ) {
		$errors->add( 'reg_privacy_error', __('Molimo prihvatite politiku privatnosti.','ivkovic') );
    }

}
add_action( 'woocommerce_register_post', 'ivkovic_validate_register_fields', 10, 3 );
 
function ivkovic_save_register_fields( $customer_id ){
 
	if ( isset( $_POST['reg_first_name'] ) ) {
        update_user_meta( $customer_id, 'first_name', wc_clean( $_POST['reg_first_name'] ) );    
        update_user_meta( $customer_id, 'billing_first_name', wc_clean( $_POST['reg_first_name'] ) );     
    }
    
    if ( isset( $_POST['reg_last_name'] ) ) {
        update_user_meta( $customer_id, 'last_name', wc_clean( $_POST['reg_last_name'] ) ); 
        update_user_meta( $customer_id, 'billing_last_name', wc_clean( $_POST['reg_last_name'] ) );     
    }
    
    if ( isset( $_POST['reg_address_1'] ) ) {
        update_user_meta( $customer_id, 'billing_address_1', wc_clean( $_POST['reg_address_1'] ) );     
    }
    
    if ( isset( $_POST['reg_city'] ) ) {
        update_user_meta( $customer_id, 'billing_city', wc_clean( $_POST['reg_city'] ) );     
    }
    
    if ( isset( $_POST['reg_phone'] ) ) {
        update_user_meta( $customer_id, 'billing_phone', wc_clean( $_POST['reg_phone'] ) );     
	}

    if ( isset( $_POST['reg_newsletter'] ) && $_POST['reg_newsletter'] ) {
        update_user_meta( $customer_id, 'newsletter', true );     
	}
 
}
add_action( 'woocommerce_created_customer', 'ivkovic_save_register_fields' );

// redirect after added to cart
function bbloomer_redirect_checkout_add_cart() {
   return get_permalink().'?added-to-cart';
}
add_filter( 'woocommerce_add_to_cart_redirect', 'bbloomer_redirect_checkout_add_cart' );

// remove sale flash on single
remove_action( 'woocommerce_before_single_product_summary', 'woocommerce_show_product_sale_flash', 10 );

// color varition circles
function variation_custom_buttons($html, $args) {
    $args = wp_parse_args(apply_filters('woocommerce_dropdown_variation_attribute_options_args', $args), array(
      'options'          => false,
      'attribute'        => false,
      'product'          => false,
      'selected'         => false,
      'name'             => '',
      'id'               => '',
      'class'            => '',
      'show_option_none' => __('Choose an option', 'woocommerce'),
   ));
  
    if(false === $args['selected'] && $args['attribute'] && $args['product'] instanceof WC_Product):
      $selected_key     = 'attribute_'.sanitize_title($args['attribute']);
      $args['selected'] = isset($_REQUEST[$selected_key]) ? wc_clean(wp_unslash($_REQUEST[$selected_key])) : $args['product']->get_variation_default_attribute($args['attribute']);
    endif;
  
    $options               = $args['options'];
    $product               = $args['product'];
    $attribute             = $args['attribute'];
    $name                  = $args['name'] ? $args['name'] : 'attribute_'.sanitize_title($attribute);
    $id                    = $args['id'] ? $args['id'] : sanitize_title($attribute);
    $class                 = $args['class'];
    $show_option_none      = (bool)$args['show_option_none'];
    $show_option_none_text = $args['show_option_none'] ? $args['show_option_none'] : __('Choose an option', 'woocommerce');

    if(empty($options) && !empty($product) && !empty($attribute)):
      $attributes = $product->get_variation_attributes();
      $options    = $attributes[$attribute];
      
    endif;

    $variations = $product->get_available_variations();

    if(!empty($options)):
        if($product && taxonomy_exists($attribute)):
            $terms = wc_get_product_terms($product->get_id(), $attribute, array(
            'fields' => 'all',
            ));

            if( $attribute == 'pa_boja' ): ?>

                <div class="single-product-color-vars-wrapper">
                    <span class="single-product-size-vars-label"><?php _e('Boje','ivkovic'); ?>:</span>
                    <div class="single-product-color-vars">

                        <?php foreach($terms as $term):
                            if(in_array($term->slug, $options, true)):

                                if( $variations ):
                                    foreach ($variations as $key => $variation):

                                        if( $variation['attributes']['attribute_pa_boja'] == $term->slug ):
                                        
                                            //echo $variation['attributes']['attribute_pa_boja'];
                                            $variation_gallery_img = $variation['image']['gallery_thumbnail_src'];
                                            //echo $variation_gallery_img;
                                            break;

                                        endif;
                                        
                                    endforeach;
                                endif;

                                $preselected = ( checked(sanitize_title($args['selected']), $term->slug, false) )?'active':''; 
                                
                                $hex_color = get_field( 'color_code', $term );
                                
                                if( $hex_color ): 
                                
                                    $color_style = ( $hex_color )?'style="background-color:'.$hex_color.'"':''; ?>
                                
                                    <div class="single-product-color-var <?php echo $preselected; ?>" data-name="<?php echo esc_attr($name); ?>" data-value="<?php echo esc_attr($term->slug); ?>" data-img="<?php echo $variation_gallery_img; ?>" data-hex-color="<?php echo $hex_color; ?>" <?php echo $color_style; ?>></div>
                                
                                <?php endif; 
                            endif;
                        endforeach; ?>

                    </div><!-- .single-product-color-vars -->

                    <?php 
                    
                    $custom_product_popup_text = get_field('custom_product_popup_text','option');
                    
                    if( $custom_product_popup_text ): ?>
                        
                        <div class="sp-custom-color">
                            <span class="sp-custom-color-label"><?php _e('* Dodatni izbor boja po želji kupca','ivkovic') ?></span>
                        </div><!-- .sp-custom-color -->

                        <div class="sp-custom-color-popup">
                            <div class="sp-custom-color-popup-inner">

                                <span><?php echo $custom_product_popup_text; ?></span>

                                <?php $phone = get_field('phone','option'); ?>

                                <?php if( $phone ): ?>

                                    <a href="<?php echo 'tel:'.str_replace(" ","",$phone); ?>"><?php echo $phone;?></a>

                                <?php endif; ?>

                            </div><!-- .sp-custom-color-popup-inner -->
                        </div><!-- .sp-custom-color-popup -->

                    <?php endif; ?>

                </div><!-- .single-product-color-vars-wrapper -->

            <?php endif;

        endif;
    endif;
  
    return $html;
}
add_filter('woocommerce_dropdown_variation_attribute_options_html', 'variation_custom_buttons', 20, 2);

//change curreny symbol
function change_currency_symbol( $symbols, $currency ) {
	if ( 'RSD' === $currency ) {
		return 'din.';
	}

    return $symbols;
}
add_filter( 'woocommerce_currency_symbol', 'change_currency_symbol', 10, 2 );

// gallery settings
add_theme_support( 'wc-product-gallery-zoom' );
add_theme_support( 'wc-product-gallery-lightbox' );
add_theme_support( 'wc-product-gallery-slider' );

// add to cart text
function custom_add_to_cart_text() {
	return __('Dodaj u korpu','ivkovic');
}
add_filter( 'woocommerce_product_single_add_to_cart_text', 'custom_add_to_cart_text' );
add_filter( 'variable_add_to_cart_text', 'custom_add_to_cart_text' );
add_filter( 'woocommerce_product_add_to_cart_text', 'custom_add_to_cart_text' );

// remove default breadcrumbs
remove_action( 'woocommerce_before_main_content', 'woocommerce_breadcrumb', 20 );

add_action( 'woocommerce_before_main_content', 'woocommerce_breadcrumb_custom', 20 );

function woocommerce_breadcrumb_custom(){
    if (function_exists('yoast_breadcrumb')): ?>

		<?php yoast_breadcrumb('
			<div class="sp-breadcrumbs" id="breadcrumbs">', '</div>
		'); ?>

	<?php endif;
}

// add shop in breadcrumb
function wpse_100012_override_yoast_breadcrumb_trail( $links ) {
    global $post;

    if ( is_singular( 'product' ) ) {

        $cats = get_the_terms( get_the_ID(), 'product_cat' );

        if( isset($cats[0]) ):
            $breadcrumb[] = array(
                'url' => get_term_link($cats[0]),
                'text' => $cats[0]->name,
            );
    
            array_splice( $links, 2, -2, $breadcrumb );
        endif;

    }elseif( is_cart() ){
        $breadcrumb[] = array(
            'url' => get_permalink(wc_get_page_id('shop')),
            'text' => __('Proizvodi','ivkovic'),
        );
        
        array_splice( $links, 1, -2, $breadcrumb );
    }elseif( is_checkout() ){
        $breadcrumb[] = array(
            'url' => get_permalink(wc_get_page_id('shop')),
            'text' => __('Proizvodi','ivkovic'),
        );

        $breadcrumb[] = array(
            'url' => get_permalink(wc_get_page_id('cart')),
            'text' => __('Korpa','ivkovic'),
        );

        array_splice( $links, 1, -2, $breadcrumb );
    }

    return $links;
}

add_filter( 'wpseo_breadcrumb_links', 'wpse_100012_override_yoast_breadcrumb_trail' );

remove_action( 'woocommerce_cart_collaterals', 'woocommerce_cross_sell_display' );

remove_action( 'woocommerce_single_product_summary', 'woocommerce_template_single_meta', 40 );
remove_action( 'woocommerce_single_product_summary', 'woocommerce_template_single_sharing', 50 );

add_action( 'woocommerce_single_product_summary', 'sp_share_links', 50 );
function sp_share_links(){
    get_template_part('template-parts/custom/social-share-links');
}

/**
 * Add a custom product data tab
 */
add_filter( 'woocommerce_product_tabs', 'woo_new_product_tab' );
function woo_new_product_tab( $tabs ) {
	
    $services = get_field('services');

    if( $services ):

        // Adds the new tab
        $tabs['test_tab'] = array(
            'title' 	=> __( 'Usluge', 'ivkovic' ),
            'priority' 	=> 50,
            'callback' 	=> 'woo_new_product_tab_content'
        );
                
    endif;

	return $tabs;

}
function woo_new_product_tab_content() {

    $services = get_field('services');

    if( $services ): ?>
        
        <div class="sp-services-tap entry-content">
            <?php echo $services; ?>
        </div><!-- .sp-services-tap -->
        
    <?php endif;
	
}

remove_action( 'woocommerce_after_single_product_summary', 'woocommerce_upsell_display', 15 );
remove_action( 'woocommerce_after_single_product_summary', 'woocommerce_output_related_products', 20 );

add_action( 'woocommerce_after_single_product_summary', 'sp_related_products', 20 );
function sp_related_products(){
    get_template_part('template-parts/custom/related-products');
}

function my_woocommerce_catalog_orderby( $orderby ) {
    unset($orderby["popularity"]);
    unset($orderby["date"]);
    return $orderby;
}
add_filter( "woocommerce_catalog_orderby", "my_woocommerce_catalog_orderby", 20 );