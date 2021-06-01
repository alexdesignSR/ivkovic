<?php if( have_rows('slides') ): ?>

    <section class="contact-slider-wrapper">

        <?php while ( have_rows('slides') ) : the_row(); 
        
        $title = get_sub_field('title');
        $text = get_sub_field('text');
        $image = get_sub_field('background');
        $map_url = get_sub_field('map_url');
        $color = get_sub_field('color');

        $color_class = ( $color )? 'contact-slide-orange':'contact-slide-blue';
        
        ?>

            <div class="contact-slide <?php echo $color_class; ?>" <?php bg($image); ?>>
                <div class="container">
                    <div class="contact-slide-box">
                        <div class="contact-slide-box-inner">

                            <?php if( $title ): ?>

                                <header class="contact-slide-header">
                                    <h2 class="contact-slide-title"><?php echo $title; ?></h2>
                                </header><!-- .contact-slide-header -->
                                
                            <?php endif; ?>

                            <?php if( $text ): ?>

                                <div class="contact-slider-text entry-content">
                                    <?php echo $text; ?>
                                </div><!-- .contact-slider-text -->
                                
                            <?php endif; ?>

                            <?php if( $map_url ): ?>

                                <div class="contact-slide-link">
                                    <a href="<?php echo $map_url; ?>" target="_blank"><i class="icon-pin"></i><?php _e('Pogledaj na Google mapi','ivkovic'); ?></a>
                                </div><!-- .contact-slide-link -->
                                
                            <?php endif; ?>

                        </div><!-- .contact-slide-box-inner -->
                    </div><!-- .contact-slide-box -->
                </div><!-- .container -->
            </div><!-- .contact-slide -->

        <?php endwhile; ?>

    </section><!-- .contact-slider-wrapper -->

<?php endif; ?>