<?php
/**
 * Template Name: Lost password
 */

get_header(); 

do_action( 'woocommerce_before_lost_password_form' );

$background = get_field('background');

?>

<div id="primary" class="content-area">
	<main id="main" class="site-main">

		<div class="login-page-wrapper lost-pass-page-wrapper">
			<div class="container">
				<div class="login-page-inner" <?php bg($background); ?>>
					<div class="login-page-form">

						<header class="login-page-header">
							<h1 class="login-page-title"><?php _e('Zaboravljena lozinka','ivkovic') ?></h1>
						</header><!-- .login-page-header -->

						<form method="post" class="woocommerce-ResetPassword lost_reset_password">

							<p><?php echo apply_filters( 'woocommerce_lost_password_message', esc_html__( 'Zaboravili ste lozinku? Unesite svoje korisničko ime ili mail. Na mail ćete dobiti link za postavljanje nove lozinke.', 'ivkovic' ) ); ?></p><?php // @codingStandardsIgnoreLine ?>

							<p class="woocommerce-form-row woocommerce-form-row--first form-row form-row-first">
								<input class="woocommerce-Input woocommerce-Input--text input-text" type="text" name="user_login" placeholder="<?php _e('*Korisničko ime ili mail','ivkovic'); ?>" id="user_login" autocomplete="username" />
							</p>

							<div class="clear"></div>

							<?php do_action( 'woocommerce_lostpassword_form' ); ?>

							<p class="woocommerce-form-row form-row">
								<input type="hidden" name="wc_reset_password" value="true" />
								<button type="submit" class="woocommerce-Button button btn-brn-prim" value="<?php esc_attr_e( 'Reset password', 'woocommerce' ); ?>"><?php esc_html_e( 'Resetujte lozinku', 'ivkovic' ); ?></button>
							</p>

							<?php wp_nonce_field( 'lost_password', 'woocommerce-lost-password-nonce' ); ?>

						</form>

					</div><!-- .login-page-form -->
				</div><!-- .login-page-inner -->
			</div><!-- .container -->
		</div><!-- .login-page-wrapper -->

	</main><!-- #main -->
</div><!-- #primary -->

<?php do_action( 'woocommerce_after_lost_password_form' );

get_footer();