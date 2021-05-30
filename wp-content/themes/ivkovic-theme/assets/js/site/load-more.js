"use strict";

// const Global = require('./global');

// let	_this;

let _this = module.exports = {

	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		newsLoadMore: $('.news-section-load-more'),
		newsItems: $('.news-section-items'),
		newsLoadMoreWrap: $('.news-section-more'),
    },

    vars: {
	},

	bind: function () {
        _this.$dom.newsLoadMore.on('click', _this.loadNews);
    },

	loadNews: function () {
        var thisEl = $(this);
		var loaded = thisEl.data('loaded');
		var max = thisEl.data('max');

		$.ajax({
			url: theme.ajaxurl,
			type: 'POST',
			dataType: 'HTML',
			data: {
				action : 'ajax_posts_load_more',
				loaded : loaded,
				max : max
			},
		}).done(function(data) {
			_this.$dom.newsItems.append(data);

			_this.$dom.newsLoadMore.data('loaded',parseInt(loaded)+2);

			if( parseInt(loaded)+6 >= max ){
				_this.$dom.newsLoadMoreWrap.hide();
			}
		});
    },

	/*-------------------------------------------------------------------------------
		# Initialize
	-------------------------------------------------------------------------------*/
	init: function () {
		_this.bind();
    },

};