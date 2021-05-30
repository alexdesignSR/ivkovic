<?php 

$text = get_sub_field('text');
$background = get_sub_field('background');
$link = get_sub_field('link');

?>

<section class="cta-wrapper" <?php bg($background); ?>>
    <div class="container">
        <div class="cta-inner">

            <?php if( $text ): ?>

                <div class="cta-text entry-content">
                    <?php echo $text; ?>
                </div><!-- .cta-text -->
                
            <?php endif; ?>

            <?php if( $link ): 
                $link_url = $link['url'];
                $link_title = $link['title'];
                $link_target = $link['target'] ? $link['target'] : '_self';
            ?>
            
                <div class="cta-link">
                    <a class="btn btn-prim" href="<?php echo esc_url($link_url); ?>" target="<?php echo esc_attr($link_target); ?>"><?php echo esc_html($link_title); ?></a>
                </div><!-- .cta-link -->
            
            <?php endif; ?>

        </div><!-- .cta-inner -->
    </div><!-- .container -->
</section><!-- .cta-wrapper -->