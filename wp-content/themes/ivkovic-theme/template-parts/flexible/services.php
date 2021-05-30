<?php 

$title = get_sub_field('title');
$image = get_sub_field('image');

if( have_rows('items') ): ?>

<section class="services-wrapper">

    <?php if( !empty($image) ): ?>

        <div class="services-image">
            <img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" />
        </div><!-- .services-image -->

    <?php endif; ?>

    <div class="services-main">
        <div class="container">
            <div class="services-inner">

                <?php if( $title ): ?>

                    <header class="services-header">
                        <h2 class="services-title"><?php echo $title; ?></h2>
                    </header><!-- .services-header -->

                <?php endif; ?>

                <div class="services-items">

                    <?php while ( have_rows('items') ) : the_row(); 
                    
                    $image = get_sub_field('image');
                    $title = get_sub_field('title');
                    
                    ?>

                        <div class="services-item">

                            <?php if( !empty($image) ): ?>
                            
                                <div class="services-item-image">
                                    <?php echo wp_get_attachment_image( $image, 'service_item' ); ?>
                                </div><!-- .services-item-image -->
                            
                            <?php endif; ?>

                            <?php if( $title ): ?>

                                <header class="services-item-header">
                                    <h4 class="services-item-title"><?php echo $title; ?></h4>
                                </header><!-- .services-item-header -->

                            <?php endif; ?>

                        </div><!-- .services-item -->

                    <?php endwhile; ?>

                </div><!-- .services-items -->

                <?php $link = get_sub_field('link');
                if( $link ): 
                    $link_url = $link['url'];
                    $link_title = $link['title'];
                    $link_target = $link['target'] ? $link['target'] : '_self';
                ?>
                
                    <div class="services-items-link">
                        <a class="btn btn-prim" href="<?php echo esc_url($link_url); ?>" target="<?php echo esc_attr($link_target); ?>"><?php echo esc_html($link_title); ?></a>
                    </div><!-- .services-items-link -->
                
                <?php endif; ?>

            </div><!-- .services-inner -->
        </div><!-- .container -->
    </div><!-- .services-main -->
</section><!-- .services-wrapper -->

<?php endif; ?>