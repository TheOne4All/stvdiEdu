<?php
/*
|--------------------------------------------------------------------------
| PUBLIC Base Loader
|--------------------------------------------------------------------------
|
| Load core Libraries via Autoloader Object
|
 */

session_start();

// require APP config file
require_once '../system/configs/app.cfg';

// require/Load autoloader object
require_once FYNX_SYSTEM['system'] . 'autoloader.php';

// load all default files and dependancies
require_once FYNX_PUBLIC['configs'] . 'site.cfg';
$autoLoader->load_files(FYNX_SYSTEM['system'], 1);