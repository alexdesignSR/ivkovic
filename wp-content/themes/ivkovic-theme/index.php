<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package Ivkovic
 */

get_header(); ?>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">

        <?php global $wp_query; 
		
		$post_index = 0;
		
		?>

        <div class="post-items-wrapper">
            <div class="container">
                <div class="post-items-inner">

					<div class="post-items-search">
						<?php get_search_form(); ?>
					</div><!-- .post-items-search -->

                    <?php if (have_posts()) : ?>

                        <div class="post-items">

                            <?php while (have_posts()) : the_post();

								if( $post_index ):
									get_template_part('template-parts/custom/post-item');
								else:
									get_template_part('template-parts/custom/post-item-wide');
									$post_index++;
								endif;

                            endwhile; ?>

                        </div><!-- .post-items -->

                    <?php else : ?>

                        <?php get_template_part('template-parts/content', 'none'); ?>

                    <?php endif; ?>

                    <?php if( $wp_query->found_posts > 7 ): ?>

                        <div class="post-items-more">
                            <span class="post-items-load-more btn btn-sec" data-loaded="7" data-max="<?php echo $wp_query->found_posts; ?>"><?php _e('Učitaj još','ivkovic'); ?></span>
                        </div><!-- .post-items-more -->

                    <?php endif; ?>

                </div><!-- .post-items-inner -->
            </div><!-- .container -->
        </div><!-- .post-items-wrapper -->

    </main><!-- #main -->
</div><!-- #primary -->

<?php get_footer(); ?>
