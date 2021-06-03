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
		// increse qty
		_this.$dom.body.on('click', '.qty-minus', _this.decreseQty);
		_this.$dom.body.on('click', '.qty-plus', _this.increseQty);
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

};
}(jQuery));