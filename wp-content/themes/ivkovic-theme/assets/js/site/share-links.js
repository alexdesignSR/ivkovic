(function ( $ ) {
"use strict";

var Global = require('./global');

var _this = module.exports = {

	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		body: $('body'),
		shareButtonsPopup: $(".social-share-links a:not(.no-popup)"),
		shareLinksWrapper: $('.social-share-links'),
		shareLinksOuterWrapper: $('.share-links-wrap'),
    },

    vars: {
	},

	/*-------------------------------------------------------------------------------
		# Initialize
	-------------------------------------------------------------------------------*/
	init: function () {
		

		_this.$dom.shareButtonsPopup.on('click', function (e) {
			e.preventDefault();
			_this.popupCenter($(this).attr('href'), $(this).attr('title'), 500, 300);
		})

		// Global.$dom.window.on( 'load scroll', _this.checkPositionOfSharelinks );

	},

	popupCenter: function (url, title, w, h) {
		// Fixes dual-screen position                         Most browsers      Firefox
		var dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : screen.left;
		var dualScreenTop = window.screenTop !== undefined ? window.screenTop : screen.top;

		var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
		var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

		var left = ((width / 2) - (w / 2)) + dualScreenLeft;
		var top = ((height / 2) - (h / 2)) + dualScreenTop;
		var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

		// Puts focus on the newWindow
		if (window.focus) {
			newWindow.focus();
		}
	},

	checkPositionOfSharelinks: function() {
		

		if( _this.$dom.shareLinksOuterWrapper.length && Global.$dom.window.width() >= 1200 ) {
			var elemToScrollTopPos = _this.$dom.shareLinksOuterWrapper.offset().top - 200;
			var windowHalfHeight = Global.$dom.window.innerHeight();
			var elemToScrollBottPos = _this.$dom.shareLinksOuterWrapper.offset().top + _this.$dom.shareLinksOuterWrapper.innerHeight() - windowHalfHeight;
			var elemePositionBottom = windowHalfHeight - 200 - _this.$dom.shareLinksWrapper.innerHeight();
			
			
			if( Global.$dom.window.scrollTop() > elemToScrollTopPos && Global.$dom.window.scrollTop() < elemToScrollBottPos ) {

				_this.$dom.shareLinksWrapper.addClass('fixed').css('top', '200px');
				_this.$dom.shareLinksWrapper.removeClass('fixed-bottom').css('bottom', 'inherit');

			} else if( Global.$dom.window.scrollTop() > elemToScrollBottPos ) {
				_this.$dom.shareLinksWrapper.removeClass('fixed').css('top', 'inherit');
				_this.$dom.shareLinksWrapper.addClass('fixed-bottom').css('bottom', elemePositionBottom);

			} else {
				_this.$dom.shareLinksWrapper.removeClass('fixed').css('top', 'inherit');
				_this.$dom.shareLinksWrapper.removeClass('fixed-bottom').css('bottom', 'inherit');
			}
		}
	}



};
}(jQuery));