<?php 
$slides = get_sub_field('slides');

if( have_rows('slides') ): 

    $slides_count = count($slides);
?>

    <section class="catal-slider-wrapper">
        <div class="container">
            <div class="catal-slider-slider">

                <?php while ( have_rows('slides') ) : the_row(); 
                
                $title = get_sub_field('title');
                $text = get_sub_field('text');
                $image = get_sub_field('image');
                $link = get_sub_field('link');

                ?>
        
                    <div class="catal-slider-slide">

                        <div class="catal-slider-overlay">
                            <div class="catal-slider-overlay-inner">

                                <div class="catal-slider-counter">

                                    <span class="catal-slider-counter-num"><?php echo str_pad(get_row_index(), 2, '0', STR_PAD_LEFT) ?></span>

                                    <div class="catal-slider-counter-status">

                                        <?php for($i=1; $i <= $slides_count; $i++): ?>

                                            <div class="catal-slider-counter-item <?php echo ( $i == get_row_index() )? 'active':''; ?>">
                                            </div><!-- .catal-slider-counter-item -->
                                            
                                        <?php endfor; ?>

                                    </div><!-- .catal-slider-counter-status -->

                                </div><!-- .catal-slider-counter -->

                                <div class="catal-slider-box">

                                    <?php if( $title ): ?>

                                        <header class="catal-slider-header">
                                            <h2 class="catal-slider-title"><?php echo $title; ?></h2>
                                        </header><!-- .catal-slider-header -->
                                        
                                    <?php endif; ?>

                                    <?php if( $text ): ?>

                                        <div class="catal-slider-text">
                                            <p><?php echo $text; ?></p>
                                        </div><!-- .catal-slider-text -->
                                        
                                    <?php endif; ?>

                                    <?php if( $link ): 
                                        $link_url = $link['url'];
                                        $link_title = ( $link['title'] )? $link['title']:__('Saznaj više','ivkovic');
                                        $link_target = $link['target'] ? $link['target'] : '_self';
                                    ?>
                                    
                                        <div class="catal-slider-link">
                                            <a class="btn btn-prim" href="<?php echo esc_url($link_url); ?>" target="<?php echo esc_attr($link_target); ?>"><?php echo $link_title; ?></a>
                                        </div><!-- .catal-slider-link -->
                                    
                                    <?php endif; ?>

                                </div><!-- .catal-slider-box -->

                            </div><!-- .catal-slider-overlay-inner -->
                        </div><!-- .catal-slider-overlay -->

                        <?php if( !empty($image) ): ?>
                        
                            <div class="catal-slider-image">
                                <img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" />
                            </div><!-- .catal-slider-image -->
                        
                        <?php endif; ?>
        
                    </div><!-- .catal-slider-slide -->
        
                <?php endwhile; ?>

            </div><!-- .catal-slider-slider -->
        </div><!-- .container -->
    </section><!-- .catal-slider-wrapper -->

<?php endif; ?>