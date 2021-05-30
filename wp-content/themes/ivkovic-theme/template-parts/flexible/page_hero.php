<?php 

$title = get_sub_field('title');
$text = get_sub_field('text');

?>

<section class="page-hero-wrapper">
    <div class="container">
        <div class="page-hero-inner">

            <?php if( $title ): ?>

                <header class="page-hero-header">
                    <h1 class="page-hero-title"><?php echo $title; ?></h1>
                </header><!-- .page-hero-header -->
                
            <?php endif; ?>

            <?php if( $text ): ?>

                <div class="page-hero-text entry-content">
                    <?php echo $text; ?>
                </div><!-- .page-hero-text -->
                
            <?php endif; ?>

        </div><!-- .page-hero-inner -->
    </div><!-- .container -->
</section><!-- .page-hero-wrapper -->