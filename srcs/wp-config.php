<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */

// MAYBE THESE ENVIRONMENTAL VARIABLES WONT WORK IN PHP FILE, TRY ????
define( 'DB_NAME', 'my_database' );

/** MySQL database username */
define( 'DB_USER', 'jaka' );

/** MySQL database password */
define( 'DB_PASSWORD', '004277' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

//  To prevent redirect to example.com
define( 'WP_SITEURL', 'https://localhost/wordpress');
define( 'WP_HOME', 'https://localhost/wordpress');
/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'I*8!`tCbdq r_%GwL`.sojF*-:Y?+$_CS,Y<4fyA>Fh,<`#@h6B;Xr.R<N5Zltpx');
define('SECURE_AUTH_KEY',  'qqMyBg-3Y;A,-o76d3j|||Az nZZ[/gRs|jO!$Z!Z<|/JiY8Q9}=-CHf/0-EoJ[J');
define('LOGGED_IN_KEY',    '$zV%VhuE(s#3B$f&deq%aJAd 1^shBM7BbHY+L>-nLj=q]AWj^l]ZO Y2V:$yvuo');
define('NONCE_KEY',        '(/_3Q-XnS-l4* zZtKL@={-4>pORSs@-k-!<4!(c6!#COm?rM,/T/]=G4FwnFc;h');
define('AUTH_SALT',        'Z5Q)Ok~:f},K(FsqF$+/rZGU:6v&C-j|7N0%-=N+|b8zWcl7u[Ph_G~eU1h/<;M!');
define('SECURE_AUTH_SALT', '*l$$+btGbbjcJ*5Y|KeIhW_K/9)LMxXyeQx{0;7|R@aKyAvpPm;/}id~`oQx lZS');
define('LOGGED_IN_SALT',   '#ouo121gL)2G[615KRjx-a+s|J<h&[Is Tw[zlsY%%N+sAM`fw?+aB0?+Oe[=k<R');
define('NONCE_SALT',       'gjql|MV%_jRc67.3-vB*G+um_/cOnj-bac $C?6QH.&J$N}yY^jD1NJ2:k+&&{z ');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';