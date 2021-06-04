<?php if( have_rows('cart_checkout_accordion','option') ): ?>
	
    <div class="cart-accord">

        <?php while ( have_rows('cart_checkout_accordion','option') ) : the_row(); 
        
            $title = get_sub_field('title');
            $text = get_sub_field('text');
            $row_index = get_row_index();

            if( $title && $title ): ?>

                <div class="cart-accord-item">
    
                    <div class="cart-accord-title cart-accord-title<?php echo $row_index; ?>" data-row="<?php echo $row_index; ?>">
                        <span><?php echo $title; ?></span>
                    </div><!-- .cart-accord-title -->
                    <div class="cart-accord-text cart-accord-text<?php echo $row_index; ?>" data-row="<?php echo $row_index; ?>">
                        <span><?php echo $text; ?></span>
                    </div><!-- .cart-accord-ttext-->
    
                </div><!-- .cart-accord-item -->

            <?php endif;
    
        endwhile; ?>

    </div><!-- .cart-accord -->

<?php endif; ?>