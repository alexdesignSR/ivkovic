<?php 
$slides = get_sub_field('slides');

if( have_rows('slides') ): 

    $slides_count = count($slides);
?>

    <section class="home-hero-wrapper">
        <div class="home-hero-slider">

            <?php while ( have_rows('slides') ) : the_row(); 
            
            $title = get_sub_field('title');
            $below_title = get_sub_field('below_title');
            $text = get_sub_field('text');
            $image = get_sub_field('image');
            $link = get_sub_field('link');

            ?>
    
                <div class="home-hero-slide">

                    <?php if( !empty($image) ): ?>
                    
                        <div class="home-hero-image">
                            <img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" />
                        </div><!-- .home-hero-image -->
                    
                    <?php endif; ?>

                    <div class="home-hero-overlay">
                        <div class="container">
                            <div class="home-hero-overlay-inner">

                                <div class="home-hero-counter">

                                    <span class="home-hero-counter-num"><?php echo str_pad(get_row_index(), 2, '0', STR_PAD_LEFT) ?></span>

                                    <div class="home-hero-counter-status">

                                        <?php for($i=1; $i <= $slides_count; $i++): ?>

                                            <div class="home-hero-counter-item <?php echo ( $i == get_row_index() )? 'active':''; ?>">
                                            </div><!-- .home-hero-counter-item -->
                                            
                                        <?php endfor; ?>

                                    </div><!-- .home-hero-counter-status -->

                                </div><!-- .home-hero-counter -->

                                <div class="home-hero-box">

                                    <?php if( $title ): ?>

                                        <header class="home-hero-header">
                                            <h2 class="home-hero-title"><?php echo $title; ?></h2>
                                        </header><!-- .home-hero-header -->
                                        
                                    <?php endif; ?>

                                    <?php if( $below_title ): ?>

                                        <header class="home-hero-below-header">
                                            <h3 class="home-hero-below-title"><?php echo $below_title; ?></h3>
                                        </header><!-- .home-hero-below-header -->

                                    <?php endif; ?>

                                    <?php if( $text ): ?>

                                        <div class="home-hero-text">
                                            <p><?php echo $text; ?></p>
                                        </div><!-- .home-hero-text -->
                                        
                                    <?php endif; ?>

                                    <?php if( $link ): 
                                        $link_url = $link['url'];
                                        $link_title = ( $link['title'] )? $link['title']:__('Saznaj više','ivkovic');
                                        $link_target = $link['target'] ? $link['target'] : '_self';
                                    ?>
                                    
                                        <div class="home-hero-link">
                                            <a class="btn btn-prim" href="<?php echo esc_url($link_url); ?>" target="<?php echo esc_attr($link_target); ?>"><?php echo $link_title; ?></a>
                                        </div><!-- .home-hero-link -->
                                    
                                    <?php endif; ?>

                                </div><!-- .home-hero-box -->

                            </div><!-- .home-hero-overlay-inner -->
                        </div><!-- .container -->
                    </div><!-- .home-hero-overlay -->
    
                </div><!-- .home-hero-slide -->
    
            <?php endwhile; ?>

        </div><!-- .home-hero-slider -->
    </section><!-- .home-hero-wrapper -->

<?php endif; ?>