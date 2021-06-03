<?php
/**
 * Template Name: Login
 */

get_header(); 

do_action( 'woocommerce_before_customer_login_form' );

$background = get_field('background');

?>

<div id="primary" class="content-area">
	<main id="main" class="site-main">

		<div class="login-page-wrapper">
			<div class="container">
				<div class="login-page-inner" <?php bg($background); ?>>
					<div class="login-page-form">

						<header class="login-page-header">
							<h1 class="login-page-title"><?php _e('Korisnički nalog','ivkovic') ?></h1>
						</header><!-- .login-page-header -->

						<form class="woocommerce-form woocommerce-form-login login" method="post">

							<?php do_action( 'woocommerce_login_form_start' ); ?>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="username" id="username" placeholder="<?php _e('*Korisničko ime ili mail','ivkovic'); ?>" autocomplete="username" value="<?php echo ( ! empty( $_POST['username'] ) ) ? esc_attr( wp_unslash( $_POST['username'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>
							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input class="woocommerce-Input woocommerce-Input--text input-text" type="password" name="password" id="password" placeholder="<?php _e('*Šifra','ivkovic'); ?>" autocomplete="current-password" />
							</p>

							<?php do_action( 'woocommerce_login_form' ); ?>

							<p class="form-row">
								<label class="woocommerce-form__label woocommerce-form__label-for-checkbox woocommerce-form-login__rememberme">
									<input class="woocommerce-form__input woocommerce-form__input-checkbox" name="rememberme" type="checkbox" id="rememberme" value="forever" /> <span><?php esc_html_e( 'Zapamti', 'ivkovic' ); ?></span>
								</label>
								<?php wp_nonce_field( 'woocommerce-login', 'woocommerce-login-nonce' ); ?>
								<button type="submit" class="woocommerce-button button woocommerce-form-login__submit btn btn-prim" name="login" value="<?php esc_attr_e( 'Log in', 'woocommerce' ); ?>"><?php esc_html_e( 'Uloguj se', 'ivkovic' ); ?></button>
							</p>
							<p class="woocommerce-LostPassword lost_password">
								<span><?php _e('Zaboravili ste šifru ili korisničko ime?','ivkovic'); ?> <a href="<?php echo get_permalink(get_field('page_lost_password','option')); ?>"><?php esc_html_e( 'Kliknite ovde', 'ivkovic' ); ?></a></span>
								<span><?php _e('Da se registrujete','ivkovic'); ?> <a href="<?php echo get_permalink(get_field('page_register','option')); ?>"><?php esc_html_e( 'Kliknite ovde', 'ivkovic' ); ?></a></span>
							</p>

							<?php do_action( 'woocommerce_login_form_end' ); ?>

						</form> 

					</div><!-- .login-page-form -->
				</div><!-- .login-page-inner -->
			</div><!-- .container -->
		</div><!-- .login-page-wrapper -->

	</main><!-- #main -->
</div><!-- #primary -->

<?php do_action( 'woocommerce_after_customer_login_form' );

get_footer();