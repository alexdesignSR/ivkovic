'use strict';

$ = require('jquery');

const Navigation = require('./core/navigation');
const Slick = require('./site/slick');
const Like = require('./site/like');
const LoadMore = require('./site/load-more');

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

});