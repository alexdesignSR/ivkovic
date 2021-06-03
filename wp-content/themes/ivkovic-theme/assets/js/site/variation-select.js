(function ( $ ) {
"use strict";

// const Global = require('./global');

// let	_this;

let _this = module.exports = {

	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		body: $('body'),
		colorItem: $('.single-product-color-var'),

		variationsForm: $(".variations_form"),
    },

    vars: {
	},

	/*-------------------------------------------------------------------------------
		# Initialize
	-------------------------------------------------------------------------------*/
	init: function () {
		_this.bind();

	},
	
	bind: function () {
		// click on color variation
		_this.$dom.colorItem.on('click', _this.changeColorVar);
	},

	changeColorVar: function () {

		_this.$dom.colorItem.removeClass('active');
		$(this).addClass('active');

		let atrributeName = $(this).attr('data-name');
		let attributeValue = $(this).attr('data-value');

		let $select = $('select[name="'+atrributeName+'"]');

		$select.val(attributeValue);
		$select.trigger('change');

		_this.showPrice();

	},

	showPrice: function () {

		var varPrice = $('.single_variation_wrap .woocommerce-variation-price .price').html();
		$('.product .entry-summary .price').html(varPrice);
	}

};

}(jQuery));