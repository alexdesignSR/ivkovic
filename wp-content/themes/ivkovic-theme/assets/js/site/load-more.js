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

		catalLoadMore: $('.catal-items-load-more'),
		catalItems: $('.catal-items'),
		catalLoadMoreWrap: $('.catal-items-more'),

		postLoadMore: $('.post-items-load-more'),
		postItems: $('.post-items'),
		postLoadMoreWrap: $('.post-items-more'),
    },

    vars: {
	},

	bind: function () {
        _this.$dom.newsLoadMore.on('click', _this.loadNews);
		_this.$dom.catalLoadMore.on('click', _this.loadCatals);
		_this.$dom.postLoadMore.on('click', _this.loadPosts);
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

	loadCatals: function () {
        var thisEl = $(this);
		var loaded = thisEl.data('loaded');
		var max = thisEl.data('max');

		$.ajax({
			url: theme.ajaxurl,
			type: 'POST',
			dataType: 'HTML',
			data: {
				action : 'ajax_catals_load_more',
				loaded : loaded,
				max : max
			},
		}).done(function(data) {
			_this.$dom.catalItems.append(data);

			_this.$dom.catalLoadMore.data('loaded',parseInt(loaded)+2);

			if( parseInt(loaded)+6 >= max ){
				_this.$dom.catalLoadMoreWrap.hide();
			}
		});
    },

	loadPosts: function () {
        var thisEl = $(this);
		var loaded = thisEl.data('loaded');
		var max = thisEl.data('max');
		var search = thisEl.data('search');

		$.ajax({
			url: theme.ajaxurl,
			type: 'POST',
			dataType: 'HTML',
			data: {
				action : 'ajax_posts_archive_load_more',
				loaded : loaded,
				max : max,
				search : search
			},
		}).done(function(data) {
			_this.$dom.postItems.append(data);

			_this.$dom.postLoadMore.data('loaded',parseInt(loaded)+2);

			console.log(parseInt(loaded)+6 +' vs '+ max);

			if( parseInt(loaded)+6 >= max ){
				_this.$dom.postLoadMoreWrap.hide();
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