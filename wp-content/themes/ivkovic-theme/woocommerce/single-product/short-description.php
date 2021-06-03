<?php
/**
 * Single product short description
 *
 * This template can be overridden by copying it to yourtheme/woocommerce/single-product/short-description.php.
 *
 * HOWEVER, on occasion WooCommerce will need to update template files and you
 * (the theme developer) will need to copy the new files to your theme to
 * maintain compatibility. We try to do this as little as possible, but it does
 * happen. When this occurs the version of the template file will be bumped and
 * the readme will list any important changes.
 *
 * @see     https://docs.woocommerce.com/document/template-structure/
 * @package WooCommerce\Templates
 * @version 3.3.0
 */

if ( ! defined( 'ABSPATH' ) ) {
	exit; // Exit if accessed directly.
}

global $post;
global $product;

$short_description = apply_filters( 'woocommerce_short_description', $post->post_excerpt );

if ( ! $short_description ) {
	return;
}

?>
<div class="sp-short-desc">
	<div class="sp-short-desc-label">
		<span><?php _e('Osobine','ivkovic'); ?>:</span>
	</div><!-- .sp-short-desc-label -->

	<div class="sp-short-desc-value">
		<?php echo $short_description; // WPCS: XSS ok. ?>
	</div><!-- .sp-short-desc-value -->
</div>

<?php $dimensions = $product->get_dimensions(); 

if( $dimensions ): 
	
	$dimensions_unit = get_option('woocommerce_dimension_unit');
	
	?>

	<div class="sp-dimensions">
		<div class="sp-dimensions-label">
			<span><span class="uppercase"><?php echo __('Dimenzije','ivkovic'). '<span> ('.$dimensions_unit.')'; ?>:</span>
		</div><!-- .sp-dimensions-label -->

		<div class="sp-dimensions-value">
			<?php echo str_replace(' '.$dimensions_unit,'',$dimensions); // WPCS: XSS ok. ?>
		</div><!-- .sp-dimensions-value -->
	</div><!-- .sp-dimensions -->
	
<?php endif; 


$sku = $product->get_sku(); 

if( $sku ): ?>

	<div class="sp-dimensions">
		<div class="sp-dimensions-label">
			<span><?php echo __('Šifra','ivkovic'); ?>:</span>
		</div><!-- .sp-dimensions-label -->

		<div class="sp-dimensions-value">
			<?php echo $sku; // WPCS: XSS ok. ?>
		</div><!-- .sp-dimensions-value -->
	</div><!-- .sp-dimensions -->
	
<?php endif; ?>