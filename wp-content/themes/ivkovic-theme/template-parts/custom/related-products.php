<?php 

$args = array(
    'post_type' => 'product',
    'posts_per_page' => 8,
    'no_found_rows'  => true,
    'category__in' => wp_get_post_categories(get_the_ID()),
    'post__not_in' => array(get_the_ID()),
);

$query = new WP_Query( $args );

if( $query->have_posts() ): ?>

<section class="related-products-wrapper">
    <div class="related-products-inner">

        <header class="related-products-header">
            <h2 class="related-products-title"><?php _e('Mozda Vam se dopadne','ivkovic'); ?></h2>
        </header><!-- .related-products-header -->
        
        <div class="related-products-items">
            <div class="related-products-items-inner">

                <?php while ( $query->have_posts() ) : $query->the_post();
                    
                    get_template_part('template-parts/custom/product-item');

                endwhile; ?>

            </div><!-- .related-products-items-inner -->
        </div><!-- .related-products-items -->

        <?php wp_reset_query(); ?>

    </div><!-- .related-products-inner -->
</section><!-- .related-products-wrapper -->

<?php endif; ?>