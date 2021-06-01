"use strict";

// const Global = require('./global');

// let	_this;

let _this = module.exports = {

	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		body: $('body'),
        likeButton: $('.post-item-like i, .single-post-like i'),

        postVideo: $('.post-item video')
    },

    vars: {
	},

    bind: function () {
        _this.$dom.likeButton.on('click', _this.like);

        _this.$dom.postVideo.click(function(){

            if( this.paused ){
                this.play();
                $(this).siblings('.post-item-video-overlay').addClass('hide');
            }else{
                this.pause();
                $(this).siblings('.post-item-video-overlay').removeClass('hide');
            }

        });
    },

    like: function () {
        var thisEl = $(this);
        var postId = thisEl.data('id');

        var likeCountEl = thisEl.closest('.post-item').find('.post-item-likes-count span');
        var likeCount = parseInt(likeCountEl.text());

        if( thisEl.hasClass('icon-heart-empty') ){
            thisEl.removeClass('icon-heart-empty').addClass('icon-heart');
            likeCountEl.text(likeCount+1);
        }else{
            thisEl.addClass('icon-heart-empty').removeClass('icon-heart');
            likeCountEl.text(likeCount-1);
        }

        if( postId ){
            $.ajax({
				url: theme.ajaxurl,
				type: 'POST',
				dataType: 'HTML',
				data: {
					action : 'ajax_post_like',
					post_id : postId,
				},
            }).done(function(data) {

            });
			
		}
    },

	/*-------------------------------------------------------------------------------
		# Initialize
	-------------------------------------------------------------------------------*/
	init: function () {
        _this.bind();
    },

};