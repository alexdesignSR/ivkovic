<?php
/**
 * The header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="content">
 *
 * @package Ivkovic
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<?php wp_head(); ?>
	<?php echo wp_kses( get_theme_mod( 'google_analytics_code' ), [ 'script' => [] ] ); ?>
	<meta name="theme-color" content="#010101">
</head>

<body <?php body_class(); ?>>
<div id="page" class="hfeed site">
	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'ivkovic' ); ?></a>
	<header id="masthead" class="site-header" role="banner">
		<div class="container logo-menu-wrapper">
			<div class="justify-content-between row">
				<div class="site-branding-main-logo site-branding">
					<div class="site-title">
						<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
							<img src="<?php echo( esc_url( get_header_image() ) ); ?>" alt="<?php echo( esc_attr( get_bloginfo( 'title' ) ) ); ?>"/>
						</a>
					</div>
				</div><!-- .site-branding -->
			
				<nav id="site-navigation" class="main-navigation" role="navigation">

					<div class="main-nav-menu">

						<?php wp_nav_menu(
							array(
								'theme_location' 		=> 	'primary',
								'menu_id' 				=> 	'primary-menu',
								'menu_class' 			=> 	'main-header-menu',
								'container_class'		=>	'main-menu-container'
							)
						); ?>

					</div><!-- .main-nav-menu -->		
					<div class="main-nav-extra">

						<div class="main-nav-acc-wrap">
							<div class="main-nav-acc-button">
								<a href="<?php echo get_permalink( get_option('woocommerce_myaccount_page_id') ); ?>"><i class="icon-user"></i></a>
							</div><!-- .main-nav-acc-button -->
							<div class="main-nav-acc-popup">
								<div class="main-nav-acc-popup-inner">

									<?php if( is_user_logged_in() ): ?>

										<div class="main-nav-acc-link main-nav-acc-link-logout">
											<a href="<?php echo wp_logout_url(); ?>"><?php _e('Odjavi se','ivkovic') ?></a>
										</div><!-- .main-nav-acc-link -->	

									<?php else: ?>

										<div class="main-nav-acc-link main-nav-acc-link-reg">
											<a href="<?php echo get_permalink(get_field('page_register','option')); ?>"><?php _e('Registruj se','ivkovic') ?></a>
										</div><!-- .main-nav-acc-link -->
										<div class="main-nav-acc-link main-nav-acc-link-login">
											<a href="<?php echo get_permalink(get_field('page_login','option')); ?>"><?php _e('Uloguj se','ivkovic') ?></a>
										</div><!-- .main-nav-acc-link -->	
										
									<?php endif; ?>

								</div><!-- .main-nav-acc-popup-inner -->
							</div><!-- .main-nav-acc-popup -->
						</div><!-- .main-nav-acc-wrap -->

						<div class="main-nav-cart">
							<?php echo do_shortcode("[woo_cart_link]"); ?>
						</div><!-- .main-nav-cart -->

						<div class="main-nav-lg-switch">
							<?php do_action('wpml_add_language_selector'); ?>
						</div><!-- .main-nav-lg-switch -->

						<div class="main-nav-search">
							<div class="main-nav-search-form">
								<?php get_search_form(); ?>
							</div><!-- .main-nav-search-form -->
							<div class="main-nav-search-button">
							<i class="icon-search"></i>
							</div><!-- .main-nav-search-button -->
						</div><!-- .main-nav-search -->

					</div><!-- .main-nav-extra -->

				</nav><!-- #site-navigation -->

				<div class="menu-toggle-wrapper">
					<a href='#' class="menu-toggle" aria-controls="primary-menu" aria-expanded="false">
						<span></span>
						<span></span>
						<span></span>
					</a>
				</div>
			</div> <!-- /.row justify-content-between -->
		</div> <!-- /.container logo-menu-wrapper -->
	</header><!-- #masthead /.site-header -->

	<div class="social-menu">

		<?php if( is_front_page() ): 
			
			$facebook_url = esc_url(get_theme_mod('social_customizer_fb_url'));
			$twitter_url = esc_url(get_theme_mod('social_customizer_tw_url'));
			$instagram_url = esc_url(get_theme_mod('social_customizer_instagram_url'));
			
			if( $facebook_url ): ?>

			<div class="social-menu-item social-menu-item-facebook">
				<a href="<?php echo $facebook_url; ?>"><i class="icon-facebook"></i></a>
			</div><!-- .social-menu-item -->
				
			<?php endif;

			if( $twitter_url ): ?>

				<div class="social-menu-item social-menu-item-twitter">
					<a href="<?php echo $twitter_url; ?>"><i class="icon-twitter"></i></a>
				</div><!-- .social-menu-item -->
					
			<?php endif;

			if( $instagram_url ): ?>

				<div class="social-menu-item social-menu-item-instagram">
					<a href="<?php echo $instagram_url; ?>"><i class="icon-instagram"></i></a>
				</div><!-- .social-menu-item -->
					
			<?php endif;
			
		endif; 
		
		$phone = get_field('phone','option');
		
		if( $phone ): ?>
			
			<div class="social-menu-item social-menu-item-phone">
				<a href="<?php echo 'tel:'.str_replace(" ","",$phone); ?>"><i class="icon-phone"></i></a>
			</div><!-- .social-menu-item -->

		<?php endif; ?>

	</div><!-- .social-menu -->

	<div class="mega-menu-wrap">
		<div class="container">
			<div class="mega-menu-inner">

				<div class="mega-menu-products">

					<header class="mega-menu-header">
						<h4 class="mega-menu-title"><?php _e('E-SHOP','ivkovic'); ?></h4>
					</header><!-- .mega-menu-header -->

					<?php wp_nav_menu(
						array(
							'theme_location' 		=> 	'mega-menu-products',
							'menu_id' 				=> 	'mega-menu-products-menu',
							'menu_class' 			=> 	'mega-menu-products-menu',
							'container_class'		=>	'mega-menu-products-container'
						)
					); ?>

					<?php $page_e_shop = get_field('page_e-shop','option'); ?>

					<?php if( $page_e_shop ): ?>

						<div class="mega-menu-link">
							<a href="<?php echo get_permalink($page_e_shop); ?>"><?php _e('Vidi sve','ivkovic'); ?></a>
						</div><!-- .mega-menu-link -->
						
					<?php endif; ?>

				</div><!-- .mega-menu-products -->

				<?php 
				
				$product_cats = get_terms( array(
					'taxonomy' => 'product_cat',
					'hide_empty' => true,
					'parent' => 0
				) );	
				
				?>

				<?php if( $product_cats ): ?>

					<div class="mega-menu-cats">

						<?php foreach ($product_cats as $key => $product_cat): ?>

							<div class="mega-menu-parent">

								<header class="mega-menu-parent-header">
									<a href="<?php echo get_term_link($product_cat,'product_cat') ?>">
										<h4 class="mega-menu-parent-title"><?php echo $product_cat->name; ?></h4>
									</a>
								</header><!-- .mega-menu-parent-header -->

								<?php 
				
								$product_cats_children = get_terms( array(
									'taxonomy' => 'product_cat',
									'hide_empty' => true,
									'parent' => $product_cat->term_id
								) );	
								
								?>

								<?php if( $product_cats_children ): ?>

									<div class="mega-menu-children">

										<?php foreach($product_cats_children as $key => $product_cats_child): ?>

											<div class="mega-menu-child">
												<a href="<?php echo get_term_link($product_cats_child,'product_cat') ?>"><?php echo $product_cats_child->name; ?></a>
											</div><!-- .mega-menu-child -->
											
										<?php endforeach; ?>

									</div><!-- .mega-menu-children -->
									
								<?php endif; ?>

							</div><!-- .mega-menu-parent -->
							
						<?php endforeach; ?>

					</div><!-- .mega-menu-cats -->
					
				<?php endif; ?>

				<?php 
				
				$mega_menu_image = get_field('mega_menu_image','option');
				$mega_menu_logo = get_field('mega_menu_logo','option');
				$mega_menu_above_discount = get_field('mega_menu_above_discount','option');
				$mega_menu_discount = get_field('mega_menu_discount','option');
				$mega_menu_below_discount = get_field('mega_menu_below_discount','option');
				
				?>

				<div class="mega-menu-image" <?php bg($mega_menu_image); ?>>
					<div class="mega-menu-image-inner">

						<div class="mega-menu-box">
							<div class="mega-menu-box-inner">

								<?php if( $mega_menu_above_discount ): ?>

									<div class="mega-menu-above-discount">
										<p><?php echo $mega_menu_above_discount; ?></p>
									</div><!-- .mega-menu-above-discount -->
									
								<?php endif; ?>

								<?php if( $mega_menu_discount ): ?>

									<div class="mega-menu-discount">
										<p><?php echo $mega_menu_discount; ?></p>
									</div><!-- .mega-menu-discount -->

								<?php endif; ?>

								<?php if( $mega_menu_below_discount ): ?>

									<div class="mega-menu-below-discount">
										<p><?php echo $mega_menu_below_discount; ?></p>
									</div><!-- .mega-menu-below-discount -->

								<?php endif; ?>

								<?php if( !empty($mega_menu_logo) ): ?>
								
									<div class="mega-menu-logo">
										<img src="<?php echo $mega_menu_logo['url']; ?>" alt="<?php echo $mega_menu_logo['alt']; ?>" />
									</div><!-- .mega-menu-logo -->
								
								<?php endif; ?>

							</div><!-- .mega-menu-box-inner -->
						</div><!-- .mega-menu-box -->

					</div><!-- .mega-menu-image-inner -->
				</div><!-- .mega-menu-image -->

			</div><!-- .mega-menu-inner -->
		</div><!-- .container -->
	</div><!-- .mega-menu-wrap -->

	<div id="content" class="site-content">