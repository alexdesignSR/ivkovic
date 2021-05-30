<?php if( have_rows('items') ): ?>

    <section class="text-slider-wrapper">

        <?php while ( have_rows('items') ) : the_row(); 
        
        $title = get_sub_field('title');
        $text = get_sub_field('text');
        $image = get_sub_field('image');
        
        ?>

            <div class="text-slide" <?php bg($image); ?>>
                <div class="text-slide-box">
                    <div class="text-slide-box-inner">

                        <?php if( $title ): ?>

                            <header class="text-slide-header">
                                <h2 class="text-slide-title"><?php echo $title; ?></h2>
                            </header><!-- .text-slide-header -->
                            
                        <?php endif; ?>

                        <?php if( $text ): ?>

                            <div class="text-slider-text entry-content">
                                <?php echo $text; ?>
                            </div><!-- .text-slider-text -->
                            
                        <?php endif; ?>

                    </div><!-- .text-slide-box-inner -->
                </div><!-- .text-slide-box -->
            </div><!-- .text-slide -->

        <?php endwhile; ?>

    </section><!-- .text-slider-wrapper -->

<?php endif; ?>




