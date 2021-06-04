<div class="share-links-wrap">
    <span class="share-links-label"><?php _e('Podeli','ivkovic'); ?>:</span>
    <div class="social-share-links">
        <a target="_blank" href="//www.facebook.com/sharer/sharer.php?u=<?php the_permalink(); ?>"><i class="icon-facebook"></i></a>
        <a target="_blank" href="//twitter.com/intent/tweet?text=<?php the_title() ?>&url=<?php the_permalink(); ?>&via=<?php site_url(); ?>"><i class="icon-twitter"></i></a>
        <a target="_blank" href="//pinterest.com/pin/create/link/?url=<?php the_permalink(); ?>&description=<?php the_excerpt() ?>&media=<?php the_post_thumbnail_url(); ?>"><i class="icon-pinterest"></i></a>
        <a class="no-popup" href="whatsapp://send?text=<?php the_permalink(); ?>" data-action="share/whatsapp/share"><i class="icon-whatsapp"></i></a>
        <a class="no-popup" href="mailto:?subject=<?php the_title(); ?>&amp;body=<?php the_permalink(); ?>"><i class="icon-mail-share"></i></a>
    </div><!-- .share-links -->
</div><!-- .share-links-wrap -->