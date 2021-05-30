<?php $title = get_sub_field('title');

$args = array(
    'post_type' => 'post',
    'posts_per_page' => 6,
);

$query = new WP_Query( $args );

if( $query->have_posts() ): ?>

<section class="news-section-wrapper">
    <div class="container">
        <div class="news-section-inner">

            <?php if( $title ): ?>

                <header class="news-section-header">
                    <h2 class="news-section-title"><?php echo $title; ?></h2>
                </header><!-- .news-section-header -->
                
            <?php endif; ?>

            <div class="news-section-items">

                <?php while ( $query->have_posts() ) : $query->the_post(); ?>
                            
                    <?php get_template_part('template-parts/custom/post-item'); ?>

                <?php endwhile; ?>

                <?php wp_reset_query(); ?>

            </div><!-- .news-section-items -->

            <?php if( $query->found_posts > 6 ): ?>

                <div class="news-section-more">
                    <span class="news-section-load-more btn btn-prim" data-loaded="6" data-max="<?php echo $query->found_posts; ?>"><?php _e('Učitaj još','ivkovic'); ?></span>
                </div><!-- .news-section-more -->
                
            <?php endif; ?>

        </div><!-- .news-section-inner -->
    </div><!-- .container -->
</section><!-- .news-section-wrapper -->


<?php endif; ?>