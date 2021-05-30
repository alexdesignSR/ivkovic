<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package Ivkovic
 */

?>
			</div><!-- #content -->

			<section class="newsletter-cta-wrapper">
				<div class="container">
					<div class="newsletter-cta-inner">

						<?php $image = get_field('newsletter_cta_image','option');
						if( !empty($image) ): ?>
						
							<div class="newsletter-cta-image">
								<img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" />
							</div><!-- .newsletter-cta-image -->
						
						<?php endif;
						
						$text = get_field('newsletter_cta_text','option');
						
						if( $text ): ?>
						
							<div class="newsletter-cta-text entry-content">
						
								<?php echo $text; ?>
						
							</div><!-- .newsletter-cta-text -->
						
						<?php endif;

						$form = get_field('newsletter_cta_form','option');
												
						if( $form ): ?>

							<div class="newsletter-cta-form entry-content">

								<?php echo $form; ?>

							</div><!-- .newsletter-cta-form -->

						<?php endif; ?>

					</div><!-- .newsletter-cta-inner -->
				</div><!-- .container -->
			</section><!-- .newsletter-cta-wrapper -->

			<?php 
				$footer_logo = get_field('footer_logo','option');
				$footer_background = get_field('footer_background','option'); 
				$address = get_field('address','option');
				$phone = get_field('phone','option');
				$email = get_field('email','option');
				$page_privacy_policy = get_field('page_privacy_policy','option');
				$copyright = get_theme_mod('footer_customizer_text');
			?>

			<footer id="colophon" class="site-footer" role="contentinfo" <?php bg($footer_background); ?>>
				<div class="container">
					<div class="footer-inner">
	
						<div class="footer-col1">
							<div class="footer-col1-inner">

								<?php if( !empty($footer_logo) ): ?>
								
									<div class="footer-logo">
										<img src="<?php echo $footer_logo['url']; ?>" alt="<?php echo $footer_logo['alt']; ?>" />
									</div><!-- .footer-logo -->
								
								<?php endif; ?>

								<div class="footer-contact">

									<?php if( $address ): ?>

										<div class="footer-contact-item footer-contact-item-address">
											<a href="https://www.google.com/maps?daddr=<?php echo str_replace(' ', '+', $address); ?>" target="_blank">
												<i class="icon-pin"></i><?php echo $address;?>
											</a>
										</div><!-- .footer-contact-item -->
										
									<?php endif; ?>

									<?php if( $phone ): ?>

										<div class="footer-contact-item footer-contact-item-phone">
											<a href="<?php echo 'tel:'.str_replace(" ","",$phone); ?>">
												<i class="icon-phone"></i><?php echo $phone;?>
											</a>
										</div><!-- .footer-contact-item -->

									<?php endif; ?>

									<?php if( $email ): ?>

										<div class="footer-contact-item footer-contact-item-email">
											<a href="<?php echo 'mailto:'.str_replace(" ","",$email); ?>">
												<i class="icon-mail"></i><?php echo $email;?>
											</a>
										</div><!-- .footer-contact-item -->

									<?php endif; ?>

								</div><!-- .footer-contact -->

							</div><!-- .footer-col1-inner -->
						</div><!-- .footer-col1 -->

						<div class="footer-col2">
							<div class="footer-col2-inner">

								<header class="footer-header">
									<h4 class="footer-title"><?php _e('Zaprati nas','ivkovic'); ?></h4>
								</header><!-- .footer-header -->

								<div class="footer-social">

									<?php 
										
									$facebook_url = esc_url(get_theme_mod('social_customizer_fb_url'));
									$twitter_url = esc_url(get_theme_mod('social_customizer_tw_url'));
									$instagram_url = esc_url(get_theme_mod('social_customizer_instagram_url'));
									
									if( $facebook_url ): ?>

									<div class="footer-social-item footer-social-item-facebook">
										<a href="<?php echo $facebook_url; ?>"><i class="icon-facebook"></i></a>
									</div><!-- .footer-social-item -->
										
									<?php endif;

									if( $twitter_url ): ?>

										<div class="footer-social-item footer-social-item-twitter">
											<a href="<?php echo $twitter_url; ?>"><i class="icon-twitter"></i></a>
										</div><!-- .footer-social-item -->
											
									<?php endif;

									if( $instagram_url ): ?>

										<div class="footer-social-item footer-social-item-instagram">
											<a href="<?php echo $instagram_url; ?>"><i class="icon-instagram"></i></a>
										</div><!-- .footer-social-item -->
											
									<?php endif; ?>

								</div><!-- .footer-social -->

							</div><!-- .footer-col2-inner -->
						</div><!-- .footer-col2 -->

						<div class="footer-col3">
							<div class="footer-col3-inner">

								<?php wp_nav_menu(
									array(
										'theme_location' 		=> 	'footer',
										'menu_id' 				=> 	'footer-menu',
										'menu_class' 			=> 	'footer-menu',
										'container_class'		=>	'footer-menu-container'
									)
								); ?>

							</div><!-- .footer-col3-inner -->
						</div><!-- .footer-col3 -->

						<div class="footer-col4">
							<div class="footer-col4-inner">

								<div class="footer-to-top">
									<a href="#page"><i class="icon-arrow-up"></i></a>
								</div><!-- .footer-to-top -->

								<?php if( $page_privacy_policy ): ?>

									<div class="footer-privacy">
										<a href="<?php echo get_the_permalink($page_privacy_policy); ?>"><?php echo get_the_title($page_privacy_policy); ?></a>
									</div><!-- .footer-privacy -->
									
								<?php endif; ?>

								<?php if( $copyright ): ?>

									<div class="footer-copyright">
										<p><?php echo $copyright; ?></p>
									</div><!-- .footer-copyright -->
									
								<?php endif; ?>

							</div><!-- .footer-col4-inner -->
						</div><!-- .footer-col4 -->

					</div><!-- .footer-inner -->
				</div><!-- .container -->
			</footer><!-- #colophon -->
		</div><!-- #page -->
		<!-- W3TC-include-css -->
		<?php wp_footer(); ?>
	<!-- W3TC-include-js-head -->
	</body>
</html>
