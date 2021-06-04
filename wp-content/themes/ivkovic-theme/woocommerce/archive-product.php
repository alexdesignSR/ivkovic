<?php
/**
 * The Template for displaying product archives, including the main shop page which is a post type archive
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/archive-product.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce\Templates
 * @version 3.4.0
 */

defined( 'ABSPATH' ) || exit;

get_header( 'shop' );

global $wp_query;

$image = get_field('shop_hero_image','option');
		
if( !empty($image) ): ?>

	<div class="single-post-hero archive-product-hero">
		<?php echo wp_get_attachment_image( $image, 'hero_image' ); ?>
	</div><!-- .single-post-hero -->

<?php endif; ?>

<section class="archive-product-wrapper">
	<div class="container">
		<div class="archive-product-inner">

			<?php if (function_exists('yoast_breadcrumb')): ?>

				<?php yoast_breadcrumb('
					<div class="sp-breadcrumbs" id="breadcrumbs">', '</div>
				'); ?>

			<?php endif; ?>

			<div class="archive-product-side">
				<div class="archive-product-side-inner">
					<?php echo do_shortcode('[searchandfilter slug="shop"]'); ?>
				</div><!-- .archive-product-side-inner -->
			</div><!-- .archive-product-side -->

			<div class="archive-product-main">
				<div class="archive-product-main-inner">

					<?php

					/**
					 * Hook: woocommerce_before_main_content.
					 *
					 * @hooked woocommerce_output_content_wrapper - 10 (outputs opening divs for the content)
					 * @hooked woocommerce_breadcrumb - 20
					 * @hooked WC_Structured_Data::generate_website_data() - 30
					 */
					do_action( 'woocommerce_before_main_content' );

					if ( woocommerce_product_loop() ) {

						/**
						 * Hook: woocommerce_before_shop_loop.
						 *
						 * @hooked woocommerce_output_all_notices - 10
						 * @hooked woocommerce_result_count - 20
						 * @hooked woocommerce_catalog_ordering - 30
						 */
						do_action( 'woocommerce_before_shop_loop' );

						woocommerce_product_loop_start();

						if ( wc_get_loop_prop( 'total' ) ) {
							while ( have_posts() ) {
								the_post();

								/**
								 * Hook: woocommerce_shop_loop.
								 */
								do_action( 'woocommerce_shop_loop' );

								get_template_part('template-parts/custom/product-item');
							}
						}

						woocommerce_product_loop_end();

						/**
						 * Hook: woocommerce_after_shop_loop.
						 *
						 * @hooked woocommerce_pagination - 10
						 */
						//do_action( 'woocommerce_after_shop_loop' );


						?>
						
							<?php if( $wp_query->found_posts > $wp_query->query_vars['posts_per_page'] ): ?>
								
								<span class="ap-load-more btn btn-sec" data-found="<?php echo $wp_query->found_posts; ?>" data-ppp="<?php echo $wp_query->query_vars['posts_per_page']+12; ?>"><?php _e('Učitaj još','ivkovic') ?></span>
						
							<?php endif; ?>
						<?php

					} else {
						/**
						 * Hook: woocommerce_no_products_found.
						 *
						 * @hooked wc_no_products_found - 10
						 */
						do_action( 'woocommerce_no_products_found' );
					}

					/**
					 * Hook: woocommerce_after_main_content.
					 *
					 * @hooked woocommerce_output_content_wrapper_end - 10 (outputs closing divs for the content)
					 */
					do_action( 'woocommerce_after_main_content' );

					?>

				</div><!-- .archive-product-main-inner -->
			</div><!-- .archive-product-main -->

		</div><!-- .archive-product-inner -->
	</div><!-- .container -->
</section><!-- .archive-product-wrapper -->


<?php get_footer( 'shop' );