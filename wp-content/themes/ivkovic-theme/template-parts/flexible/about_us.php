<?php 

$title = get_sub_field('title');
$text = get_sub_field('text');
$link = get_sub_field('link');
$background = get_sub_field('background');
$image = get_sub_field('image');

?>

<section class="about-us-wrapper" <?php bg($background); ?>>
    <div class="container">
        <div class="about-us-inner">

            <div class="about-us-box">
                <div class="about-us-box-inner">

                    <?php if( $title ): ?>

                        <header class="about-us-header">
                            <h2 class="about-us-title"><?php echo $title; ?></h2>
                        </header><!-- .about-us-header -->

                    <?php endif; ?>

                    <?php if( $text ): ?>

                        <div class="about-as-text entry-content">
                            <?php echo $text; ?>
                        </div><!-- .about-as-text -->
                        
                    <?php endif; ?>

                    <?php if( $link ): 
                        $link_url = $link['url'];
                        $link_title = $link['title'];
                        $link_target = $link['target'] ? $link['target'] : '_self';
                    ?>
                    
                        <div class="about-us-link">
                            <a class="btn btn-prim" href="<?php echo esc_url($link_url); ?>" target="<?php echo esc_attr($link_target); ?>"><?php echo esc_html($link_title); ?></a>
                        </div><!-- .about-us-link -->
                    
                    <?php endif; ?>

                </div><!-- .about-us-box-inner -->
            </div><!-- .about-us-box -->

            <?php if( !empty($image) ): ?>
            
                <div class="about-us-image">
                    <img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" />
                </div><!-- .about-us-image -->
            
            <?php endif; ?>

        </div><!-- .about-us-inner -->
    </div><!-- .container -->
</section><!-- .about-us-wrapper -->