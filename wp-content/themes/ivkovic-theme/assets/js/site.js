'use strict';

$ = require('jquery');

const Navigation = require('./core/navigation');
const Slick = require('./site/slick');
const Like = require('./site/like');
const LoadMore = require('./site/load-more');
const VarSelect = require('./site/variation-select');
const ProductQty = require('./site/product-qty');
const Share = require('./site/share-links');

jQuery( function(){

  /**
   * Initialize site navigation
   */
  Navigation.init();

  /**
   * Initialize slick
   */
  Slick.init();

  /**
   * Initialize like module
   */
  Like.init();

    /**
   * Initialize load more module
   */
  LoadMore.init();

  /**
   * Initialize Variation select
   */
  VarSelect.init();

  /**
   * Initialize ProductQty
   */
  ProductQty.init();

  /**
   * Initialize Share
   */
   Share.init();

});