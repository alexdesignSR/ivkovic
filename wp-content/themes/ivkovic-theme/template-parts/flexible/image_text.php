<?php 

$title = get_sub_field('title');
$text = get_sub_field('text');
$layout = get_sub_field('layout');
$type = get_sub_field('type');
$images = get_sub_field('images');

$layout_class = ( $layout )? 'layout-text-image':'layout-image-text';

?>

<section class="image-text-wrapper image-text-<?php echo $type.' '.$layout_class; ?>">
    <div class="container">
        <div class="image-text-inner">

            <?php if( $title || $text ): ?>

                <div class="image-text-main">
                    <div class="image-text-main-inner">

                        <?php if( $title ): ?>

                            <header class="image-text-header">
                                <h2 class="image-text-title"><?php echo $title; ?></h2>
                            </header><!-- .image-text-header -->
                            
                        <?php endif; ?>

                        <?php if( $text ): ?>

                            <div class="image-text-text entry-content">
                                <?php echo $text; ?>
                            </div><!-- .image-text-text -->
                            
                        <?php endif; ?>

                    </div><!-- .image-text-main-inner -->
                </div><!-- .image-text-main -->

            <?php endif; ?>

            <?php if( $images ): ?>

                <div class="image-text-images">

                    <?php foreach ($images as $key => $image): ?>

                        <?php if( !empty($image) ): ?>
                        
                            <div class="image-text-image">
                                <?php echo wp_get_attachment_image( $image, 'image_text' ); ?>
                            </div><!-- .image-text-image -->
                        
                        <?php endif; ?>
                        
                    <?php endforeach; ?>

                </div><!-- .image-text-2 -->
                
            <?php endif; ?>

        </div><!-- .image-text-inner -->
    </div><!-- .container -->
</section><!-- .image-text-wrapper -->