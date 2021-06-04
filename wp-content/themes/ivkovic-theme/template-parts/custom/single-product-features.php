<?php if( have_rows('single_product_features','option') ): ?>
		
    <div class="sp-features-wrap">
        <div class="container">
            <div class="sp-features-inner">

                <?php while ( have_rows('single_product_features','option') ) : the_row(); 
                
                    $icon = get_sub_field('icon');
                    $title = get_sub_field('title');
                    $text = get_sub_field('text');

                ?>
        
                    <div class="sp-features-item">
        
                        <?php if( !empty($icon) ): ?>
                        
                            <div class="sp-features-icon	">
                                <img src="<?php echo $icon['url']; ?>" alt="<?php echo $icon['alt']; ?>" />
                            </div><!-- .sp-features-icon	 -->
                        
                        <?php endif; ?>

                        <?php if( $title ): ?>

                            <header class="sp-features-header">
                                <h4 class="sp-features-title"><?php echo $title; ?></h4>
                            </header><!-- .sp-features-header -->
                            
                        <?php endif; ?>

                        <?php if( $text ): ?>

                            <div class="sp-features-text">
                                <p><?php echo $text; ?></p>
                            </div><!-- .sp-features-text -->
                            
                        <?php endif; ?>
        
                    </div><!-- .sp-features-item -->
        
                <?php endwhile; ?>
    
            </div><!-- .sp-features-inner -->
        </div><!-- .container -->
    </div><!-- .sp-features-wrap -->

<?php endif; ?>