<?php 

$title = get_sub_field('title');
$content = get_sub_field('content');
$background = get_sub_field('background');

?>

<section class="job-form-wrapper" <?php bg($background); ?>>
    <div class="container">
        <div class="job-form-inner">

            <?php if( $title ): ?>

                <header class="job-form-header">
                    <h1 class="job-form-title"><?php echo $title; ?></h1>
                </header><!-- .job-form-header -->
                
            <?php endif; ?>

            <?php if( $content ): ?>

                <div class="job-form-content entry-content">
                    <?php echo $content; ?>
                </div><!-- .job-form-content -->
                
            <?php endif; ?>

        </div><!-- .job-form-inner -->
    </div><!-- .container -->
</section><!-- .job-form-wrapper -->