<?php 

$title = get_sub_field('title');

if( have_rows('boxes') ): ?>

<section class="fe-cat-wrapper">
    <div class="container">
        <div class="fe-cat-inner">

            <?php if( $title ): ?>

                <header class="fe-cat-header">
                    <h2 class="fe-cat-title"><?php echo $title; ?></h2>
                </header><!-- .fe-cat-header -->
                
            <?php endif; ?>

            <div class="fe-cat-items">

                <?php while ( have_rows('boxes') ) : the_row();
                    
                    $link = get_sub_field('link');

                    if( $link ): 
                        $link_url = $link['url'];
                        $link_title = $link['title'];
                        $link_target = $link['target'] ? $link['target'] : '_self';

                        $subitems = get_sub_field('subitems');

                        $has_subitems = ( $subitems )? true:false;
                        $has_subitems_class = ( $has_subitems )? 'has-subitems':'no-subitems';

                        ?>

                        <div class="fe-cat-item <?php echo 'fe-cat-item'.get_row_index().' '.$has_subitems_class; ?>">
                            <div class="fe-cat-item-init">
                                <div class="fe-cat-item-init-inner">

                                    <?php if( $has_subitems ): ?>
                                        <span><?php echo esc_html($link_title); ?></span>
                                    <?php else: ?>
                                        <a href="<?php echo esc_url($link_url); ?>" target="<?php echo esc_attr($link_target); ?>"><?php echo esc_html($link_title); ?></a>
                                    <?php endif; ?>

                                </div><!-- .fe-cat-item-init-inner -->
                            </div><!-- .fe-cat-item-init -->

                            <?php if( have_rows('subitems') ): ?>
                            
                                <div class="fe-cat-item-hover">
                                    <div class="fe-cat-item-hover-inner">

                                        <?php while ( have_rows('subitems') ) : the_row(); 
                                        
                                            $sublink = get_sub_field('link');
                                            
                                            if( $sublink ): 
                                            
                                                $sublink_url = $sublink['url'];
                                                $sublink_title = $sublink['title'];
                                                $sublink_target = $sublink['target'] ? $sublink['target'] : '_self';
                                            
                                            ?>

                                                <a href="<?php echo esc_url($sublink_url); ?>" target="<?php echo esc_attr($sublink_target); ?>"><?php echo esc_html($sublink_title); ?></a>
                                                
                                            <?php endif; ?>
                                
                                        <?php endwhile; ?>

                                    </div><!-- .fe-cat-item-hover-inner -->
                                </div><!-- .fe-cat-item-hover -->

                            <?php endif; ?>

                        </div><!-- .fe-cat-item -->

                    <?php endif; ?>
                    
                <?php endwhile; ?>

            </div><!-- .fe-cat-items -->

        </div><!-- .fe-cat-inner -->
    </div><!-- .container -->
</section><!-- .fe-cat-wrapper -->

<?php endif; ?>