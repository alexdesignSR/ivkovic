<?php

function ivkovic_register_catalogue() {
    $singular = 'Catalogue'; // Book
	$plural = 'Catalogues';  // Books
	
    $slug = str_replace( ' ', '-', strtolower( $singular ) );

    $labels = array(
        'name' 			      => __( $plural, 'ivkovic' ),
        'singular_name' 	  => __( $singular, 'ivkovic' ),
        'add_new' 		      => _x( 'Add New', 'ivkovic', 'ivkovic' ),
        'add_new_item'  	  => __( 'Add New ' . $singular, 'ivkovic' ),
        'edit'		          => __( 'Edit', 'ivkovic' ),
        'edit_item'	          => __( 'Edit ' . $singular, 'ivkovic' ),
        'new_item'	          => __( 'New ' . $singular, 'ivkovic' ),
        'view' 			      => __( 'View ' . $singular, 'ivkovic' ),
        'view_item' 		  => __( 'View ' . $singular, 'ivkovic' ),
        'search_term'   	  => __( 'Search ' . $plural, 'ivkovic' ),
        'parent' 		      => __( 'Parent ' . $singular, 'ivkovic' ),
        'not_found'           => __( 'No ' . $plural .' found', 'ivkovic' ),
        'not_found_in_trash'  => __( 'No ' . $plural .' in Trash', 'ivkovic' ),
    );

    $args = array(
        'labels'              => $labels,
        'hierarchical'        => false,
        'public'              => true,
        'show_in_menu'        => true,
        'show_in_nav_menus'   => true,
        'has_archive'         => true,
        'rewrite'             => array('slug' => __('katalozi','ivkovic')),
        'menu_icon'           => 'dashicons-analytics',
        'supports'            => array( 'title', 'thumbnail' )
    );

    register_post_type( $slug, $args );
}

add_action( 'init', 'ivkovic_register_catalogue' );