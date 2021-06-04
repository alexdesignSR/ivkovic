<?php
/**
 * The Template for displaying all single products
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/single-product.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see         https://docs.woocommerce.com/document/template-structure/
 * @package     WooCommerce\Templates
 * @version     1.6.4
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly
}

get_header( 'shop' ); 
global $product;

$has_added = ( isset($_GET["added-to-cart"]) )? true:false;

?>

<div id="primary" class="content-area">
	<main id="main" class="site-main" role="main">
	
		<div class="single-product-main-wrapper">
			<div class="container">
				<div class="single-product-main-inner">

					<?php
						/**
						 * woocommerce_before_main_content hook.
						 *
						 * @hooked woocommerce_output_content_wrapper - 10 (outputs opening divs for the content)
						 * @hooked woocommerce_breadcrumb - 20
						 */
						do_action( 'woocommerce_before_main_content' );
					?>

						<?php while ( have_posts() ) : ?>
							<?php the_post(); ?>

							<?php wc_get_template_part( 'content', 'single-product' ); ?>

						<?php endwhile; // end of the loop. ?>

					<?php
						/**
						 * woocommerce_after_main_content hook.
						 *
						 * @hooked woocommerce_output_content_wrapper_end - 10 (outputs closing divs for the content)
						 */
						do_action( 'woocommerce_after_main_content' );
					?>


				</div><!-- .single-product-main-inner -->
			</div><!-- .container -->
		</div><!-- .single-product-main-wrapper -->

		<?php get_template_part('template-parts/custom/single-product-features'); ?>

		<?php if( !$has_added ): ?>

			<div class="sp-bottom-wrapper">
				<div class="container">
					<div class="sp-bottom-inner">

						<div class="sp-bottom-image">

							<?php if( has_post_thumbnail() ):
								echo get_the_post_thumbnail(get_the_ID(),'thumbnail');
							else:
								echo wc_placeholder_img();
							endif; ?>

						</div><!-- .sp-bottom-image -->

						<div class="sp-bottom-title-price">

							<header class="sp-bottom-header">
								<h3 class="sp-bottom-title"><?php the_title(); ?></h3>
							</header><!-- .sp-bottom-header -->

							<span class="sp-bottom-price"><?php echo $product->get_price_html(); ?></span>

						</div><!-- .sp-bottom-title-price -->

						<div class="sp-bottom-buttons">

							<span class="btn btn-prim sp-bottom-buy"><?php _e('Dodaj u korpu','ivkovic'); ?></span>

							<?php $page_contact = get_field('page_contact','option'); ?>

							<?php if( $page_contact ): ?>

								<a class="btn btn-prim" href="<?php echo get_permalink($page_contact); ?>"><?php _e('Kontaktirajte nas','ivkovic'); ?></a>
								
							<?php endif; ?>

						</div><!-- .sp-bottom-buttons -->

						<?php get_template_part('template-parts/custom/social-share-links'); ?>

					</div><!-- .sp-bottom-inner -->
				</div><!-- .container -->
			</div><!-- .sp-bottom-wrapper -->

		<?php endif; ?>
			
	</main><!-- #main -->
</div><!-- #primary -->


<?php
get_footer( 'shop' );

/* Omit closing PHP tag at the end of PHP files to avoid "headers already sent" issues. */
