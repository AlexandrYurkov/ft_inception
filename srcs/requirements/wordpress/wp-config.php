<?php

define( 'DB_NAME', getenv('DB_NAME'));
define( 'DB_USER', getenv('DB_USER'));
define( 'DB_PASSWORD', getenv('DB_PASSWORD'));
define( 'DB_HOST', getenv('DB_HOST'));
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define( 'WP_ALLOW_REPAIR', true );
define( 'WP_HOME', getenv('WP_HOME'));
define( 'WP_SITEURL', getenv('WP_SITEURL'));

// Redis

define( 'WP_CACHE', true );
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', '6379' );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
define( 'WP_CACHE_KEY_SALT', 'lfallon.42.fr' );

// Authentication Keys.

define( 'AUTH_KEY', 'AUTH_KEY' );
define( 'SECURE_AUTH_KEY', 'SECURE_AUTH_KEY' );
define( 'LOGGED_IN_KEY', 'LOGGED_IN_KEY' );
define( 'NONCE_KEY', 'NONCE_KEY' );
define( 'AUTH_SALT', 'AUTH_SALT' );
define( 'SECURE_AUTH_SALT', 'SECURE_AUTH_SALT' );
define( 'LOGGED_IN_SALT', 'LOGGED_IN_SALT' );
define( 'NONCE_SALT', 'NONCE_SALT' );

$table_prefix = 'wp_';
define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>