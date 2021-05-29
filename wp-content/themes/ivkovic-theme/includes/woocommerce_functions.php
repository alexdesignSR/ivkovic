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