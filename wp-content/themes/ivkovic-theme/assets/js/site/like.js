"use strict";

// const Global = require('./global');

// let	_this;

let _this = module.exports = {

	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		body: $('body'),
        likeButton: $('.post-item-like i'),
    },

    vars: {
	},

    bind: function () {
        _this.$dom.likeButton.on('click', _this.like);
    },

    like: function () {
        var thisEl = $(this);
        var postId = thisEl.data('id');

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
                if( thisEl.hasClass('icon-heart-empty') ){
                    thisEl.removeClass('icon-heart-empty').addClass('icon-heart');
                }else{
                    thisEl.addClass('icon-heart-empty').removeClass('icon-heart');
                }
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