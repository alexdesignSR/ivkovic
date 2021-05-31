<?php 

$text = get_field('text');
$file = get_field('file');

?>

<div class="catal-item">

    <div class="catal-item-image">
        <a href="<?php echo $file; ?>" target="_blank">

            <?php if( has_post_thumbnail() ):
                echo get_the_post_thumbnail(get_the_ID(),'catalogue');
            else: ?>

                <img src="<?php echo get_template_directory_uri(); ?>/assets/images/catal-item.jpg" alt="catal-item" />

            <?php endif; ?>

        </a>
    </div><!-- .catal-item-image -->

    <div class="catal-item-main">
        <header class="catal-item-header">
            <a href="<?php echo $file; ?>" target="_blank">
                <h4 class="catal-item-title"><?php the_title(); ?></h4>
            </a>
        </header><!-- .catal-item-header -->

        <?php if( $text ): ?>

            <div class="catal-item-text">
                <p><?php echo $text; ?></p>
            </div><!-- .catal-item-text -->
            
        <?php endif; ?>

        <div class="catal-item-bottom">
            <div class="catal-item-date">
                <i class="icon-calendar"></i><span><?php echo get_the_date(); ?></span>
            </div><!-- .catal-item-date -->
            <div class="catal-item-share">
                <i class="icon-share"></i>
            </div><!-- .catal-item-share -->
        </div><!-- .catal-item-bottom -->
    </div><!-- .catal-item-main -->

</div><!-- .catal-item -->