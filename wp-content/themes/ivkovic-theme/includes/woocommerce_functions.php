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
   return home_url();
}
add_filter( 'woocommerce_add_to_cart_redirect', 'bbloomer_redirect_checkout_add_cart' );
 
// add shop in breadcrumb
add_filter( 'woocommerce_get_breadcrumb', function($crumbs, $Breadcrumb){
    $shop_page_id = wc_get_page_id('shop'); //Get the shop page ID
    if($shop_page_id > 0 && !is_shop()) { //Check we got an ID (shop page is set). Added check for is_shop to prevent Home / Shop / Shop as suggested in comments
        $new_breadcrumb = [
            _x( 'Proizvodi', 'breadcrumb', 'ivkovic' ), //Title
            get_permalink(wc_get_page_id('shop')) // URL
        ];
        array_splice($crumbs, 1, 0, [$new_breadcrumb]); //Insert a new breadcrumb after the 'Home' crumb
    }
    return $crumbs;
}, 10, 2 );

// change breadcrumb delimiter
function wcc_change_breadcrumb_delimiter( $defaults ) {
	// Change the breadcrumb delimeter from '/' to '>'
	$defaults['delimiter'] = ' &gt; ';
	return $defaults;
}
add_filter( 'woocommerce_breadcrumb_defaults', 'wcc_change_breadcrumb_delimiter' );

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

                    <div class="sp-custom-color">
                        <span class="sp-custom-color-label"><?php _e('* Dodatni izbor boja po želji kupca','ivkovic') ?></span>
                    </div><!-- .sp-custom-color -->
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