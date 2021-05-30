<?php 

$title = get_sub_field('title');
$text = get_sub_field('text');
$background_top = get_sub_field('background_top');
$background_bottom = get_sub_field('background_bottom');

if( have_rows('items') ): ?>

    <section class="timeline-wrapper" <?php bg($background_top); ?>>
        <div class="container">
            <div class="timeline-inner">

                <?php if( $title ): ?>

                    <header class="timeline-header">
                        <h1 class="timeline-title"><?php echo $title; ?></h1>
                    </header><!-- .timeline-header -->
                    
                <?php endif; ?>

                <?php if( $text ): ?>

                    <div class="timeline-text entry-content">
                        <?php echo $text; ?>
                    </div><!-- .timeline-text -->
                    
                <?php endif; ?>

                <div class="timeline-items">

                    <?php while ( have_rows('items') ) : the_row(); 
                    
                        $year = get_sub_field('year');
                        $image = get_sub_field('image');
                        $title = get_sub_field('title');
                        $text = get_sub_field('text');

                        $type_class = ( get_row_index()%2 )? 'timeline-item-left':'timeline-item-right';
                    
                    ?>

                        <div class="timeline-item <?php echo $type_class; ?>">

                            <?php if( $title || $text ): ?>

                                <div class="timeline-left">

                                    <?php if( $title ): ?>

                                        <header class="timeline-item-header">
                                            <h6 class="timeline-item-title"><?php echo $title; ?></h6>
                                        </header><!-- .timeline-item-header -->
                                        
                                    <?php endif; ?>

                                    <?php if( $text ): ?>

                                        <div class="timeline-item-text entry-content">
                                            <?php echo $text; ?>
                                        </div><!-- .timeline-item-text -->
                                        
                                    <?php endif; ?>

                                </div><!-- .timeline-left -->

                            <?php endif; ?>

                            <?php if( !empty($image) ): ?>
                            
                                <div class="timeline-item-center">
                                    <div class="timeline-item-image">
                                        <?php echo wp_get_attachment_image( $image, 'timeline' ); ?>
                                    </div><!-- .timeline-item-image -->
                                </div><!-- .timeline-item-center -->
                            
                            <?php endif; ?>

                            <?php if( $year ): ?>

                                <div class="timeline-item-right">
                                    <div class="timeline-item-year">
                                        <p><?php echo $year; ?></p>
                                    </div><!-- .timeline-item-year -->
                                </div><!-- .timeline-item-right -->
                                
                            <?php endif; ?>

                        </div><!-- .timeline-item -->

                    <?php endwhile; ?>

                </div><!-- .timeline-items -->

            </div><!-- .timeline-inner -->
        </div><!-- .container -->

        <div class="timeline-bottom" <?php bg($background_bottom); ?>>
        </div><!-- .timeline-bottom -->
    </section><!-- .timeline-wrapper -->

<?php endif; ?>