"use strict";

    
/**  
 * 1. Add [ "slick-carousel": "1.8.1" ], to package.json
 * 2. npm install
 * 3. Import slick scss file in assets/scss/plugins/slick.scss => @import "../../../node_modules/slick-carousel/slick/slick.scss";
 * 4. Add require('slick-carousel');
 * 5. Initialize slick
 * 
*/
require('slick-carousel');

module.exports = {
	
	/*-------------------------------------------------------------------------------
		# Cache dom and strings
	-------------------------------------------------------------------------------*/
	$dom: {
		homeHero: $(".home-hero-slider"),
		catalSlider: $('.catal-slider-slider'),
		testimonials: $('.tst-items'),
		textSlider: $('.text-slider-wrapper'),
		contactSlider: $('.contact-slider-wrapper'),
		imageText: $('.image-text-images'),
		relatedProducts: $('.related-products-items-inner'),
	},
	
	/*-------------------------------------------------------------------------------
		# Initialize
	-------------------------------------------------------------------------------*/
	init: function () {

		this.$dom.homeHero.slick({
			slidesToScroll: 1,
			slidesToShow: 1,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

		this.$dom.catalSlider.slick({
			slidesToScroll: 1,
			slidesToShow: 1,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

		this.$dom.testimonials.slick({
			slidesToScroll: 3,
			slidesToShow: 3,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

		this.$dom.textSlider.slick({
			slidesToScroll: 1,
			slidesToShow: 1,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

		this.$dom.contactSlider.slick({
			slidesToScroll: 1,
			slidesToShow: 1,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

		this.$dom.imageText.slick({
			slidesToScroll: 1,
			slidesToShow: 1,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

		this.$dom.relatedProducts.slick({
			slidesToScroll: 4,
			slidesToShow: 4,
			dots: false,
			arrows: true,
			prevArrow: "<span class='slick-prev pull-left'><i class='icon-angle-left'></i></span>",
			nextArrow: "<span class='slick-next pull-right'><i class='icon-angle-right'></i></span>",
		});

	}
};