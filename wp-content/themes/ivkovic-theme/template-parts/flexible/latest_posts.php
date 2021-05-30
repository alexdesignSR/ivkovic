<?php $title = get_sub_field('title');

$args = array(
    'post_type' => 'post',
    'posts_per_page' => 3,
    'no_found_rows'  => true,
);

$query = new WP_Query( $args );

if( $query->have_posts() ): ?>

    <section class="latest-posts-wrapper">
        <div class="container">
            <div class="latest-posts-inner">

                <?php if( $title ): ?>

                    <header class="latest-posts-header">
                        <h2 class="latest-posts-title"><?php echo $title; ?></h2>
                    </header><!-- .latest-posts-header -->
                    
                <?php endif; ?>

                <div class="latest-posts-items">

                    <?php while ( $query->have_posts() ) : $query->the_post(); ?>
                        
                        <?php get_template_part('template-parts/custom/post-item'); ?>

                    <?php endwhile; ?>

                    <?php wp_reset_query(); ?>

                </div><!-- .latest-posts-items -->

                <div class="latest-posts-link">
                    <a class="btn btn-prim" href="<?php echo get_permalink( get_option( 'page_for_posts' ) ); ?>"><?php _e('Pogledaj sve','ivkovic'); ?></a>
                </div><!-- .latest-posts-link -->

            </div><!-- .latest-posts-inner -->
        </div><!-- .container -->
    </section><!-- .latest-posts-wrapper -->

<?php endif; ?>