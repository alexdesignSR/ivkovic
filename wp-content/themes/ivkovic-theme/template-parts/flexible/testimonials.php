<?php 

$title = get_sub_field('title');

if( have_rows('testimonials','option') ): ?>

    <section class="tst-section-wrapper">
        <div class="container">
            <div class="tst-section-inner">

                <?php if( $title ): ?>

                    <header class="tst-header">
                        <h2 class="tst-title"><?php echo $title; ?></h2>
                    </header><!-- .tst-header -->
                    
                <?php endif; ?>

                <div class="tst-items">
                
                    <?php while ( have_rows('testimonials','option') ) : the_row(); 
                    
                    $author_photo = get_sub_field('author_photo');
                    $author = get_sub_field('author');
                    $stars = get_sub_field('stars');
                    $text = get_sub_field('text');
                    
                    ?>

                        <div class="tst-item">
                            <div class="tst-item-inner">
                                <div class="tst-item-top">

                                    <?php if( !empty($author_photo) ): ?>
                                    
                                        <div class="tst-item-image">
                                            <?php echo wp_get_attachment_image( $author_photo, 'thumbnail' ); ?>
                                        </div><!-- .tst-item-image -->
                                    
                                    <?php endif; ?>

                                    <div class="tst-item-top-right">

                                        <?php if( $author ): ?>

                                            <header class="tht-item-header">
                                                <h6 class="tht-item-title"><?php echo $author; ?></h6>
                                            </header><!-- .tht-item-header -->
                                            
                                        <?php endif; ?>

                                        <div class="tst-item-stars">

                                            <?php for($i=0; $i < $stars; $i++): ?>

                                                <i class="icon-star"></i>
                                                
                                            <?php endfor; ?>

                                        </div><!-- .tst-item-stars -->

                                    </div><!-- .tst-item-top-right -->

                                </div><!-- .tst-item-top -->

                                <?php if( $text ): ?>

                                    <div class="tst-item-text">
                                        <p>"<?php echo $text; ?>"</p>
                                    </div><!-- .tst-item-text -->
                                    
                                <?php endif; ?>

                            </div><!-- .tst-item-inner -->
                        </div><!-- .tst-item -->

                    <?php endwhile; ?>

                </div><!-- .tst-items -->

            </div><!-- .tst-section-inner -->
        </div><!-- .container -->
    </section><!-- .tst-section-wrapper -->

<?php endif; ?>