<?php
/**
 * Template Name: Register
 */

get_header(); 

do_action( 'woocommerce_before_customer_login_form' );

$background = get_field('background');

?>

<div id="primary" class="content-area">
	<main id="main" class="site-main">

		<div class="login-page-wrapper register-page-wrapper" <?php bg($background); ?>>
			<div class="container">
				<div class="login-page-inner">
					<div class="login-page-form">

						<header class="login-page-header">
							<h1 class="login-page-title"><?php _e('Registracija','ivkovic') ?></h1>
						</header><!-- .login-page-header -->

						<form method="post" class="woocommerce-form woocommerce-form-register register" <?php do_action( 'woocommerce_register_form_tag' ); ?> >

							<?php do_action( 'woocommerce_register_form_start' ); ?>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="reg_first_name" id="reg_first_name" placeholder="<?php _e('*Ime','ivkovic'); ?>" value="<?php echo ( ! empty( $_POST['reg_first_name'] ) ) ? esc_attr( wp_unslash( $_POST['reg_first_name'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="reg_last_name" id="reg_last_name" placeholder="<?php _e('*Prezime','ivkovic'); ?>" value="<?php echo ( ! empty( $_POST['reg_last_name'] ) ) ? esc_attr( wp_unslash( $_POST['reg_last_name'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="reg_address_1" id="reg_address_1" placeholder="<?php _e('*Adresa','ivkovic'); ?>" value="<?php echo ( ! empty( $_POST['reg_address_1'] ) ) ? esc_attr( wp_unslash( $_POST['reg_address_1'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="reg_city" id="reg_city" placeholder="<?php _e('*Grad','ivkovic'); ?>" value="<?php echo ( ! empty( $_POST['reg_city'] ) ) ? esc_attr( wp_unslash( $_POST['reg_city'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="text" class="woocommerce-Input woocommerce-Input--text input-text" name="reg_phone" id="reg_phone" placeholder="<?php _e('*Telefon','ivkovic'); ?>" value="<?php echo ( ! empty( $_POST['reg_phone'] ) ) ? esc_attr( wp_unslash( $_POST['reg_phone'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="email" class="woocommerce-Input woocommerce-Input--text input-text" name="email" id="reg_email" placeholder="<?php _e('*Elektronska pošta','ivkovic'); ?>" autocomplete="email" value="<?php echo ( ! empty( $_POST['email'] ) ) ? esc_attr( wp_unslash( $_POST['email'] ) ) : ''; ?>" /><?php // @codingStandardsIgnoreLine ?>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="password" class="woocommerce-Input woocommerce-Input--text input-text" name="password" id="reg_password" placeholder="<?php _e('*Šifra','ivkovic'); ?>" autocomplete="new-password" />
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="checkbox" id="reg_privacy" name="reg_privacy" value="reg_privacy" <?php echo ( ! empty( $_POST['reg_privacy'] ) ) ? 'checked' : ''; ?>>
								<label for="reg_privacy"><?php _e('Saglasan/na sam sa Politikom Privatnosti','ivkovic'); ?></label>

								<input class="woocommerce-form__input woocommerce-form__input-checkbox" name="rememberme" type="checkbox" id="rememberme" value="forever" /> <span><?php esc_html_e( 'Zapamti', 'ivkovic' ); ?></span>
								<label class="woocommerce-form__label woocommerce-form__label-for-checkbox woocommerce-form-login__rememberme"></label>
							</p>

							<p class="woocommerce-form-row woocommerce-form-row--wide form-row form-row-wide">
								<input type="checkbox" id="reg_newsletter" name="reg_newsletter" value="reg_newsletter" <?php echo ( ! empty( $_POST['reg_newsletter'] ) ) ? 'checked' : ''; ?>>
								<label for="reg_newsletter"><?php _e('Želim da se informišem putem Newsletter-a','ivkovic'); ?></label><br>
							</p>

							<?php do_action( 'woocommerce_register_form' ); ?>

							<p class="woocommerce-form-row form-row">
								<?php wp_nonce_field( 'woocommerce-register', 'woocommerce-register-nonce' ); ?>
								<button type="submit" class="woocommerce-Button woocommerce-button button woocommerce-form-register__submit" name="register" value="<?php esc_attr_e( 'Register', 'woocommerce' ); ?>"><?php esc_html_e( 'Registruj se', 'ivkovic' ); ?></button>
							</p>

							<?php do_action( 'woocommerce_register_form_end' ); ?>

						</form>

					</div><!-- .login-page-form -->
				</div><!-- .login-page-inner -->
			</div><!-- .container -->
		</div><!-- .login-page-wrapper -->

	</main><!-- #main -->
</div><!-- #primary -->

<?php do_action( 'woocommerce_after_customer_login_form' );

get_footer();