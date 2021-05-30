<div class="product-item">
    <a href="<?php echo get_permalink(); ?>">
        <div class="product-item-inner">

            <div class="product-item-image">

                <?php if( has_post_thumbnail() ):
                    echo get_the_post_thumbnail(get_the_ID(),'woocommerce_thumbnail');
                else:
                    echo wc_placeholder_img();
                endif; ?>

            </div><!-- .product-item-image -->

            <header class="product-item-header">
                <h4 class="product-item-title"><?php the_title(); ?></h4>
            </header><!-- .product-item-header -->

        </div><!-- .product-item-inner -->
    </a>
</div><!-- .product-item -->