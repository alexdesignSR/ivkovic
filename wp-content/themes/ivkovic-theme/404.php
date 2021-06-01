<?php
/**
 * The template for displaying 404 pages (not found).
 *
 * @package Ivkovic
 */

get_header(); 

$line1 = get_field('404_line1','option');
$line2 = get_field('404_line2','option');
$background = get_field('404_background','option');
?>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">

        <div class="404-page-wrapper" <?php bg($background); ?>>
            <div class="container">
                <div class="404-page-inner">

                    <header class="404-header">
                        <h1 class="404-title">404</h1>
                    </header><!-- .404-header -->

                    <?php if( $line1 ): ?>

                        <div class="404-line1">
                            <p><?php echo $line1; ?></p>
                        </div><!-- .404-line1 -->
                        
                    <?php endif; ?>

                    <?php if( $line2 ): ?>

                        <div class="404-line2">
                            <p><?php echo $line2; ?></p>
                        </div><!-- .404-line2 -->

                    <?php endif; ?>

                </div><!-- .404-page-inner -->
            </div><!-- .container -->
        </div><!-- .404-page-wrapper -->

    </main><!-- #main -->
</div><!-- #primary -->

<?php get_footer(); ?>
