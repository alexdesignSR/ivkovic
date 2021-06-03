<?php
/**
 * The template used for displaying page content in page.php
 *
 * @package Ivkovic
 */

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>

	<?php if (function_exists('yoast_breadcrumb')): ?>

		<?php yoast_breadcrumb('
			<div class="sp-breadcrumbs" id="breadcrumbs">', '</div>
		'); ?>

	<?php endif; ?>

	<?php if( !is_cart() ): ?>

		<header class="entry-header">
			<?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>
		</header><!-- .entry-header -->
		
	<?php endif; ?>

	<div class="entry-content">
		<?php the_content(); ?>
		<?php
			wp_link_pages( array(
				'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'ivkovic' ),
				'after'  => '</div>',
			) );
		?>
	</div><!-- .entry-content -->
</article><!-- #post-## -->

