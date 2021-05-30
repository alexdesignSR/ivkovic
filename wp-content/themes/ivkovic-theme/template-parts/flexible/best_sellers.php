<?php $title = get_sub_field('title');
$posts = get_sub_field('products');
if( $posts ): ?>

    <section class="best-sellers-wrapper">
        <div class="container">
            <div class="best-sellers-inner">

                <?php if( $title ): ?>

                    <header class="best-sellers-header">
                        <h2 class="best-sellers-title"><?php echo $title; ?></h2>
                    </header><!-- .best-sellers-header -->
                    
                <?php endif; ?>

                <div class="best-sellers-items">

                    <?php foreach( $posts as $post): ?>
                        <?php setup_postdata($post); ?>

                        <?php get_template_part( 'template-parts/custom/product-item' ); ?>

                    <?php endforeach; ?>

                </div><!-- .best-sellers-items -->

                <div class="best-sellers-link">
                    <a class="btn btn-prim" href="<?php echo get_permalink( woocommerce_get_page_id( 'shop' ) ); ?>"><?php _e('Pogledaj sve','ivkovic'); ?></a>
                </div><!-- .best-sellers-link -->

            </div><!-- .best-sellers-inner -->
        </div><!-- .container -->
    </section><!-- .best-sellers-wrapper -->

    <?php wp_reset_postdata(); ?>
<?php endif; ?>