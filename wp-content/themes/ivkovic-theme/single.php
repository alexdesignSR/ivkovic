<?php
/**
 * The template for displaying all single posts.
 *
 * @package Ivkovic
 */

get_header(); ?>

<div id="primary" class="content-area">
	<main id="main" class="site-main" role="main">

		<?php $image = get_field('single_post_hero_image','option');
		$content_middle = get_field('content_middle');
		$content_bottom = get_field('content_bottom');
		
		if( !empty($image) ): ?>
		
			<div class="single-post-hero">
				<img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" />
			</div><!-- .single-post-hero -->

		<?php endif; ?>

		<div class="single-post-main-wrapper">
			<div class="container">
				<div class="single-post-main-inner">

					<header class="single post-header">
						<h1 class="single post-title"><?php the_title(); ?></h1>
					</header><!-- .single post-header -->

					<div class="single-post-date">
						<i class="icon-calendar"></i><span><?php echo get_the_date(); ?></span>
					</div><!-- .single-post-date -->

					<div class="single-post-content entry-content">
						<?php the_content(); ?>
					</div><!-- .single-post-content -->

					<?php if( $content_middle || has_post_thumbnail() ): ?>
						
						<div class="single-post-middle">

							<?php if( $content_middle ): ?>

								<div class="single-post-middle-content entry-content">
									<?php echo $content_middle; ?>
								</div><!-- .single-post-middle-content -->
								
							<?php endif; ?>

							<?php if( has_post_thumbnail() ): ?>

								<div class="single-post-image">
									<?php the_post_thumbnail('single_post'); ?>
								</div><!-- .single-post-image -->
								
							<?php endif; ?>

						</div><!-- .single-post-middle -->

					<?php endif; ?>

					<?php if( $content_bottom ): ?>

						<div class="single-post-bottom entry-content">
							<?php echo $content_bottom; ?>
						</div><!-- .single-post-bottom -->
						
					<?php endif; ?>

					<div class="single-post-bottom2">

					<div class="single-post-like">
						<?php echo get_like_button( get_the_ID() ); ?><span><?php _e('Like','ivkovic'); ?></span>
					</div><!-- .single-post-like -->
					<div class="single-post-share">
						<i class="icon-share"></i><span><?php _e('Share','ivkovic'); ?></span>
					</div><!-- .single-post-share -->

					</div><!-- .single-post-bottom2 -->

				</div><!-- .single-post-main-inner -->
			</div><!-- .container -->
		</div><!-- .single-post-main-wrapper -->
			
	</main><!-- #main -->
</div><!-- #primary -->

<?php get_footer(); ?>
