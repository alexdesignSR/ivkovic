<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package Ivkovic
 */

get_header(); ?>

<div id="primary" class="content-area">
	<main id="main" class="site-main" role="main">
		<section class="single-page-wrapper">
			<div class="container">
				<div class="single-page-inner">

					<?php while ( have_posts() ) : ?>

						<?php the_post(); ?>

						<?php get_template_part( 'template-parts/content', 'page' ); ?>

					<?php endwhile; // End of the loop. ?>

				</div><!-- .single-page-inner -->
			</div><!-- .container -->
		</section><!-- .single-page-wrapper -->
	</main><!-- #main -->
</div><!-- #primary -->

<?php get_footer(); ?>
