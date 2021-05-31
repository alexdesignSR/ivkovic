<?php
/**
 * The template for displaying archive pages.
 *
 * Learn more: http://codex.wordpress.org/Template_Hierarchy
 *
 * @package Ivkovic
 */

get_header(); ?>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">

        <div class="catal-hero">
            <div class="container">
                <div class="catal-hero-inner">

                    <header class="catal-header">
                        <h1 class="catal-title"><?php _e('Katalozi','ivkovic'); ?></h1>
                    </header><!-- .catal-header -->

                </div><!-- .catal-hero-inner -->
            </div><!-- .container -->
        </div><!-- .catal-hero -->

        <?php global $wp_query; ?>

        <div class="catal-items-wrapper">
            <div class="container">
                <div class="catal-items-inner">

                    <?php if (have_posts()) : ?>

                        <div class="catal-items">

                            <?php while (have_posts()) : the_post(); ?>

                                <?php get_template_part('template-parts/custom/catalogue-item'); ?>

                            <?php endwhile; ?>

                        </div><!-- .catal-items -->

                    <?php else : ?>

                        <?php get_template_part('template-parts/content', 'none'); ?>

                    <?php endif; ?>

                    <?php if( $wp_query->found_posts > 6 ): ?>

                        <div class="catal-items-more">
                            <span class="catal-items-load-more btn btn-sec" data-loaded="6" data-max="<?php echo $wp_query->found_posts; ?>"><?php _e('Učitaj još','ivkovic'); ?></span>
                        </div><!-- .catal-items-more -->

                    <?php endif; ?>

                </div><!-- .catal-items-inner -->
            </div><!-- .container -->
        </div><!-- .catal-items-wrapper -->

    </main><!-- #main -->
</div><!-- #primary -->

<?php get_footer(); ?>
