(function ( $ ) {
"use strict";

// var Global = require('./global');

// let	_this;

var _this = module.exports = {

	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		body: $('body'),
		bottomPrice: $('.sp-bottom-price'),
		bottomBuy: $('.sp-bottom-buy'),
		spAdded: $('.sp-added-to-cart.product'),
    },

    vars: {
	},

	/*-------------------------------------------------------------------------------
		# Initialize
	-------------------------------------------------------------------------------*/
	init: function () {
		_this.bind();

		if( _this.$dom.spAdded.length ){
			var selectedColor = _this.$dom.spAdded.data('selected-color');

			if( selectedColor ){
				$('.single-product-color-var[data-value="'+selectedColor+'"]').show();
			}
		}
	},
	
	bind: function () {
		// increse qty
		_this.$dom.body.on('click', '.qty-minus', _this.decreseQty);
		_this.$dom.body.on('click', '.qty-plus', _this.increseQty);
		_this.$dom.body.on('click', '.ap-load-more', _this.loadMore);

		_this.$dom.bottomBuy.on('click', _this.buy);

		_this.$dom.body.on( "show_variation", function ( event, variation ) {
			setTimeout(function(){ 
				var priceHTML = $('.product .price').html();
				_this.$dom.bottomPrice.html(priceHTML);
			}, 500)
		});
	},
	
	increseQty: function () {

		var val = parseInt($(this).parent().siblings('input').val());
		$(this).parent().siblings('input').val(val + 1).trigger('change');

	},

	decreseQty: function () {

		var val = parseInt($(this).parent().siblings('input').val());
		if( val > 1 ){
			$(this).parent().siblings('input').val(val - 1).trigger('change');
		}

	},

	buy: function () {
		$('.single_add_to_cart_button').trigger('click');
	},

	loadMore: function () {
		var thisEl = $(this);
		var found = thisEl.data('found');
		var ppp = thisEl.data('ppp');

		$('select[name="_sf_ppp[]"] option:nth-child(2)').val(ppp);

		$('select[name="_sf_ppp[]"]').val(ppp).trigger('change');
	},

};
}(jQuery));