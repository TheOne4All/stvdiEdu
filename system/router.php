<?php

/**
 *
 * The Mapper class is responsible for routing URL's to destinations,
 * it is simple yet efficient. Works with the .htaccess file in the root folder.
 * It creates URL address properties using Class/Property/Module (name),
 * Funtion/Method/Hook (name) & Parameters
 *
 * @version:       1.11.19
 * @package:       FYNX Framework
 * @author:        Jencube Team
 * @license:       http://opensource.org/licenses/gpl-license.php
 *                 GNU General Public License (GPL)
 * @copyright:     Copyright (c) 2013 - 2020 Jencube
 * @github:        @deusex0 & @TheOne4All
 * @filesource:    system/mapping/Mapper.php
 *
 **/

class Mapper
{
    /**
     *
     * Default Landing "Name" of Class/Property/Module
     *
     * @access protected
     * @var string
     *
     **/
    protected $module = 'auth';

    /**
     *
     * Default Landing "Name" of Funtion/Method/Hook
     *
     * @access protected
     * @var string
     *
     **/
    protected $hook = 'signin';

    /**
     *
     * Default Landing Array Object Passed to Page/URL
     *
     * @access protected
     * @var array
     *
     **/
    protected $props = [];

    /**
     *
     * Default Redirect "Name" of Class/Property/Module
     *
     * @access protected
     * @var string
     *
     **/
    protected $redirect_module = '';

    /**
     *
     * Default Redirect "Name" of Funtion/Method/Hook
     *
     * @access protected
     * @var string
     *
     **/
    protected $redirect_hook = '';

    /**
     *
     * Default Redirect Array Object Passed to Page/URL
     *
     * @access protected
     * @var array
     *
     **/
    protected $redirect_props = [];

    public function __construct()
    {

        $url = $this->parserUrl();

        if (isset($url)) {

            // force redirect to signin page if auth session is FALSE
            if ($url[0] != $this->redirect_module && !empty($this->redirect_module)) {
                if (!isset($_SESSION['authenticated']) || $_SESSION['authenticated'] == false) {
                    $url[0] = $this->redirect_module;
                    $url[1] = $this->redirect_hook;
                }
            }

            // create or reset search filter session
            if (!isset($_SESSION['file_path'])) {
                if (session_status() == PHP_SESSION_ACTIVE) {
                    $_SESSION['file_path'] = $url[0] . $url[1];
                    $_SESSION['search_filter'] = [];
                }
            } else {
                if (isset($url[1]) && $_SESSION['file_path'] != $url[0] . $url[1]) {
                    // foreach ($_SESSION['search_filter'] as $key => $value) {
                    //     $_SESSION['search_filter'][$key] = null;
                    // }
                    $_SESSION['search_filter'] = [];
                    $_SESSION['file_path'] = $url[0] . $url[1];
                }
            }

            // filters for Class/Property/Module name
            if (file_exists(FYNX_PUBLIC['hooks'] . $url[0] . '.hook')) {
                $this->module = $url[0];
                unset($url[0]);
                require_once FYNX_PUBLIC['hooks'] . $this->module . '.hook';
                $this->module = new $this->module;

                // filters for Funtions/Methods/Hooks name in Class
                if (isset($url[1])) {
                    if (method_exists($this->module, $url[1])) {
                        $this->hook = $url[1];
                        unset($url[1]);

                        // filters for Parameters/Props as array
                        $this->props = $url ? array_values($url) : [];

                        // group all URL address properties to locate Funtions/Methods/Hooks in Class/Property/Module
                        call_user_func_array([$this->module, $this->hook], $this->props);
                    } else {
                        if (method_exists($this->module, "index")) {
                            $this->hook = "index";

                            // group all URL address properties to locate Funtions/Methods/Hooks in Class/Property/Module
                            call_user_func_array([$this->module, $this->hook], [$url[1]]);
                        } else {
                            $this->getErrorPage();
                        }
                    }
                } else {
                    if (method_exists($this->module, "index")) {
                        $this->hook = "index";

                        // filters for Parameters/Props as array
                        $this->props = $url ? array_values($url) : [];

                        // group all URL address properties to locate Funtions/Methods/Hooks in Class/Property/Module
                        call_user_func_array([$this->module, $this->hook], $this->props);
                    } else {
                        $this->getErrorPage();
                    }
                }
            } else {
                $this->getErrorPage();
            }
        } else {
            require_once FYNX_PUBLIC['hooks'] . $this->module . '.hook';
            $this->module = new $this->module;

            // group all URL address properties to locate Funtions/Methods/Hooks in Class/Property/Module
            call_user_func_array([$this->module, $this->hook], $this->props);
        }
    }

    private function parserUrl()
    {
        if (isset($_GET['url'])) {

            // convert and return the .htaccess rewrite URL into Arrays
            $url = explode('/', filter_var(rtrim($_GET['url'], '/'), FILTER_SANITIZE_URL));
            if (!isset($url[1])) {
                $url[1] = "index";
            }
            return $url;
        }
    }

    public function getErrorPage()
    {
        $module = 'errors';
        $hook = 'error_404';
        $props = [];
        require_once FYNX_PUBLIC['hooks'] . $module . '.hook';
        $module = new $module;

        // group all URL address properties to locate Funtions/Methods/Hooks in Class/Property/Module
        call_user_func_array([$module, $hook], $props);
    }
}

$mapper = new Mapper;
// echo "<h1>Mapper</h1>";