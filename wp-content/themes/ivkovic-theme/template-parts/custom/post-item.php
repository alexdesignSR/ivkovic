<?php $likes_count = get_post_meta(get_the_ID(),'likes_count',true); ?>

<div class="post-item">

    <div class="post-item-image">
        <a href="<?php echo get_permalink(); ?>">

            <?php if( has_post_thumbnail() ):
                echo get_the_post_thumbnail(get_the_ID(),'post_item');
            else: ?>

                <img src="<?php echo get_template_directory_uri(); ?>/assets/images/post-item.jpg" alt="post-item" />

            <?php endif; ?>

        </a>
    </div><!-- .post-item-image -->

    <div class="post-item-likes">
        <div class="post-item-likes-count">
            <span><?php echo ( $likes_count )? $likes_count:0; ?></span>
        </div><!-- .post-item-likes-count -->
        <div class="likes-count-icon">
            <i class="icon-heart"></i>
        </div><!-- .likes-count-icon -->
    </div><!-- .post-item-likes -->

    <div class="post-item-main">
        <header class="post-item-header">
            <a href="<?php echo get_permalink(); ?>">
                <h4 class="post-item-title"><?php the_title(); ?></h4>
            </a>
        </header><!-- .post-item-header -->
        <div class="post-item-bottom">
            <div class="post-item-date">
                <i class="icon-calendar"></i><span><?php echo get_the_date(); ?></span>
            </div><!-- .post-item-date -->
            <div class="post-item-like">
                <?php echo get_like_button( get_the_ID() ); ?>
            </div><!-- .post-item-like -->
            <div class="post-item-share">
                <i class="icon-share"></i>
            </div><!-- .post-item-share -->
        </div><!-- .post-item-bottom -->
    </div><!-- .post-item-main -->

</div><!-- .post-item -->