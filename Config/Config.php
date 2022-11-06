<?php

const BASE_URL = 'http://localhost/biblioteca/';
define('URL_BIBLIOTECA', 'http://localhost/biblioteca/');

$path = dirname(dirname(__FILE__));

define("PATH_DIR", $path . '/');
define("PATH_CONTROLLERS", PATH_DIR . 'Controllers/');
define("PATH_LIBRARIES", PATH_DIR . 'Libraries/');
define("PATH_MODELS", PATH_DIR . 'Models/');
define("PATH_VIEW", PATH_DIR . 'Views/');

define("TIME_SESSION", array('horas' => 2, 'minutos' => 0));

define("PATH_FOTOPERFIL", 'C:/wamp64/www/biblioteca/Assets/images/fotoperfil/');
define("PATH_FOTOAUTOR", 'C:/wamp64/www/biblioteca/Assets/images/autores/');
define("PATH_FOTOLIBRO", 'C:/wamp64/www/biblioteca/Assets/images/libros/');

date_default_timezone_set('America/Lima');

const DB_BIB = 'aesanluc_biblioteca';
const DB_INT = 'intranet';

const DB_HOST = 'localhost';
const DB_USER = 'root';
const DB_PASSWORD = '';
const SB_CHARSET ='charset=utf8';

define("VER_MEDIA", "1.0.0.0");