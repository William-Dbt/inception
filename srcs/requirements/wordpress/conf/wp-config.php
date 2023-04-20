<?php
/**
 * La configuration de base de votre installation WordPress.
 *
 * Ce fichier contient les réglages de configuration suivants : réglages MySQL,
 * préfixe de table, clés secrètes, langue utilisée, et ABSPATH.
 * Vous pouvez en savoir plus à leur sujet en allant sur
 * {@link https://fr.wordpress.org/support/article/editing-wp-config-php/ Modifier
 * wp-config.php}. C’est votre hébergeur qui doit vous donner vos
 * codes MySQL.
 *
 * Ce fichier est utilisé par le script de création de wp-config.php pendant
 * le processus d’installation. Vous n’avez pas à utiliser le site web, vous
 * pouvez simplement renommer ce fichier en "wp-config.php" et remplir les
 * valeurs.
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Réglages MySQL - Votre hébergeur doit vous fournir ces informations. ** //
/** Nom de la base de données de WordPress. */
define('DB_NAME', 'wordpress');

/** Utilisateur de la base de données MySQL. */
define('DB_USER', '');

/** Mot de passe de la base de données MySQL. */
define('DB_PASSWORD', '');

/** Adresse de l’hébergement MySQL. */
define('DB_HOST', '');

/** Jeu de caractères à utiliser par la base de données lors de la création des tables. */
define('DB_CHARSET', 'utf8');

/** Type de collation de la base de données.
  * N’y touchez que si vous savez ce que vous faites.
  */
define('DB_COLLATE', 'utf8_general_ci');

/**#@+
 * Clés uniques d’authentification et salage.
 *
 * Remplacez les valeurs par défaut par des phrases uniques !
 * Vous pouvez générer des phrases aléatoires en utilisant
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ le service de clefs secrètes de WordPress.org}.
 * Vous pouvez modifier ces phrases à n’importe quel moment, afin d’invalider tous les cookies existants.
 * Cela forcera également tous les utilisateurs à se reconnecter.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'lMg) z(w`~-`180|j,f4mt;uI(_8K%}<-3Im}2mv;mH:S&WQX@_ENt>4Ma-9 p!)');
define('SECURE_AUTH_KEY',  '}[!^BzIp@!mC8t<x!{#~m5(411Xb#kQJM=C|tJ06LDcK>_-#Ia4#zJnnCTpXP?j(');
define('LOGGED_IN_KEY',    'GkV~L9)8oi( ?J0^_DKd$T(?v2U|g+,|Zem_cfuG8{fQrd|scNXa[.hC%Ls(e*S]');
define('NONCE_KEY',        'tvHa-lf[i+FydvJNR_j>&}5@J3eyl}>OJGP*2Qn2KDuaRiH%!]|hsX*)GA006cM]');
define('AUTH_SALT',        '[,m,P*<V d%SStva4Rv^5uXVQJNd/B$UVubm5%xw6=Ikl}msS5oin+AbjBC*;:>j');
define('SECURE_AUTH_SALT', '0rnRnXltpD!ryz_fb{?j;vvU&D_|.w-CZfvr+L72:As%^=TD@9dAj~oV%7bVj-m/');
define('LOGGED_IN_SALT',   'HC#zBLJa9[13i/AE!ZuZ|r+#~v(z&)NJ+y=$z]43&$g!FS+fRDL-NPGEyYKist9T');
define('NONCE_SALT',       '#edyL)R*acN*l>?Y|fkql_qPf@]C9{oB$:REN1H?VI0fcRK{YNQ(5..JZqldgP}a');
/**#@-*/

/**
 * Préfixe de base de données pour les tables de WordPress.
 *
 * Vous pouvez installer plusieurs WordPress sur une seule base de données
 * si vous leur donnez chacune un préfixe unique.
 * N’utilisez que des chiffres, des lettres non-accentuées, et des caractères soulignés !
 */
$table_prefix = 'wp_';

/**
 * Pour les développeurs et développeuses : le mode déboguage de WordPress.
 *
 * En passant la valeur suivante à "true", vous activez l’affichage des
 * notifications d’erreurs pendant vos essais.
 * Il est fortemment recommandé que les développeurs d’extensions et
 * de thèmes se servent de WP_DEBUG dans leur environnement de
 * développement.
 *
 * Pour plus d’information sur les autres constantes qui peuvent être utilisées
 * pour le déboguage, rendez-vous sur la documentation.
 *
 * @link https://fr.wordpress.org/support/article/debugging-in-wordpress/
 */
define('WP_DEBUG', false);

/* C’est tout, ne touchez pas à ce qui suit ! Bonne publication. */

/** Chemin absolu vers le dossier de WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', '/var/www/html');


	
/** Réglage des variables de WordPress et de ses fichiers inclus. */
require_once(ABSPATH . 'wp-settings.php');
