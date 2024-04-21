<?php

/**
 *
 * The Autoloader class helps load files from folders and sub-folders.
 *
 * @version:       1.03.21
 * @package:       FYNX Framework
 * @author:        Jencube Team
 * @license:       http://opensource.org/licenses/gpl-license.php
 *                 GNU General Public License (GPL)
 * @copyright:     Copyright (c) 2021 Jencube
 * @github:        @deusex0 & @TheOne4All
 * @filesource:    system/autoloader.php
 *
 **/

class Autoloader
{

    /**
     *
     * load type variable
     *
     * @access Private
     * @var string
     *
     **/
    private $_loadType = 'require_once';

    /**
     *
     * Default file directory variable
     *
     * @access Private
     * @var Array | String
     *
     **/
    private $_directories = [
        FYNX_DIR . 'system/',
    ];

    /**
     *
     * Autoload config variable
     *
     * @access Private
     * @var Array
     *
     **/
    private $_autoloadConfig;

    /**
     *
     * Autoload config variable
     *
     * @access Private
     * @var Array
     *
     **/
    private $_styleMediaType = ['all', 'aural', 'braile', 'handheld', 'projection', 'print', 'screen', 'tty', 'tv'];

    public $instantiateClass = array();

    protected $_unloadFiles;

    /**
     *
     * Class constructor initialization to set the class properties
     * and connection to the database
     *
     * @access Public
     *
     **/
    public function __construct()
    {
        $this->_autoloadConfig = include_once FYNX_DIR . '/system/configs/autoload.cfg';
    }

    /**
     *
     * Set load type variable
     *
     * @access Public
     * @return Bool
     * @param String $type -> Type of load; include, include_once, require, require_once
     * @default require_once
     *
     **/
    public function set_load_type($type = null)
    {
        $this->_loadType = (!empty($type)) ? $type : $this->_loadType;
        // return;
    }

    /**
     *
     * Set autoloads config file
     *
     * @access Public
     * @return Bool
     * @param String $configFile -> The path to the config file
     *
     **/
    public function set_autoload_config($configFile)
    {

        if (file_exists($configFile)) {

            $this->_autoloadConfig = include_once $configFile;
        }
        return false;
    }

    /**
     *
     * Set directory to load it's file
     *
     * @access Public
     * @return Bool
     * @param Array | String $directories -> List of diretory in array or a single folder in string
     *
     **/
    public function set_directory($directories)
    {

        if (!is_array($directories)) {

            if (!is_dir($directories)) {
                // log here: invalid file extension, extension input not array
                return false;
            }
        }
        $this->_directories = $directories;
    }

    /**
     *
     * Process files to be loaded from specified or default directory
     *
     * @access Public
     * @return Bool
     * @param Array | String $file -> List of diretory in array or a single folder in string
     *
     **/
    public function load_file($file)
    {
        $files[] = $file;
        $this->_load_file($files);
    }

    /**
     *
     * Process files to be loaded from specified or default directory
     *
     * @access Public
     * @return Bool
     * @param Array | String $path -> List of diretory in array or a single folder in string
     * @param Array | String $attributes -> List of diretory in array or a single folder in string
     *
     **/
    public function load_html_files($path = null, $attributes = null)
    {
        $htmlTag = "";
        // <link rel="stylesheet" type="text/css" href ="style.css">
        // attributes: crossorigin, href, hreflang, media, referrerpolicy, rel, sizes, title, type

        // <script async type="text/javascript" src="//cdn.snigelweb.com/pub/w3schools.com/snhb-loader.min.js"></script>
        // attributes: async, crossorigin, defer, integrity, nomodule, referrepolicy, src, type

        $files = (is_dir($path)) ? $this->_get_directory_files($path) : $path;
        if (is_dir($path)) {
            // echo 'directory';
        }
        $tagAttribute = (!is_null($attributes)) ? $attributes : "";

        if (is_array($files)) {

            foreach ($files as $file) {

                $setAttribute = $tagAttribute;
                $setAttribute = (is_array($setAttribute)) ? $this->_check_file_media($file, $setAttribute) : $setAttribute;

                $htmlTag .= $this->_set_html_tag($file, $setAttribute);
            }
        } else {

            $tagAttribute = (is_array($tagAttribute)) ? $this->_check_file_media($files, $tagAttribute) : $tagAttribute;
            $htmlTag = $this->_set_html_tag($files, $tagAttribute);
        }
        echo $htmlTag;
    }

    private function _check_file_media($file, $tagAttribute)
    {

        $getName = pathinfo($file, PATHINFO_FILENAME);
        $fileNameArr = explode("-", $getName);

        if (count($fileNameArr) >= 1) {

            unset($fileNameArr[0]);
            $checkMedia = array_values(array_intersect($this->_styleMediaType, $fileNameArr));

            if (is_array($tagAttribute)) {

                if (count($checkMedia) > 0) {

                    if (!array_key_exists('media', $tagAttribute)) {
                        $getMedia = "";

                        foreach ($checkMedia as $media) {

                            // $tagAttribute['media'] .= $media . ', ';
                            $getMedia .= $media . ', ';
                        }

                        // $tagAttribute['media'] = rtrim( $tagAttribute['media'], ', ' );
                        $tagAttribute['media'] = rtrim($getMedia, ', ');
                    }
                }

                $tagAttribute = $this->_set_tag_attributes($tagAttribute);
            } else {

                $tagAttribute .= (strrpos($tagAttribute, 'media=') !== false) ? $tagAttribute : $tagAttribute .= 'media="' . $checkMedia[0] . '" ';
            }
        }
        return $tagAttribute;
    }

    private function _set_tag_attributes($attributes)
    {
        $tagAttribute = "";

        foreach ($attributes as $attribName => $attribValue) {

            if ($attribName == "async") {

                $tagAttribute .= $attribValue . ' ';
            } else {

                $tagAttribute .= $attribName . '=' . '"' . $attribValue . '" ';
            }
        }
        return $tagAttribute;
    }

    private function _set_html_tag($file, $tagAttribute = null)
    {
        $htmlTag = "";
        $fileExtension = pathinfo($file, PATHINFO_EXTENSION);
        $file = str_replace(FYNX_DIR, FYNX_URL, $file);

        switch ($fileExtension) {
            case 'js':
                if (strrpos($tagAttribute, 'type=') !== false) {

                    $htmlTag = '<script ' . $tagAttribute . 'src="' . $file . '"></script>';
                } else {

                    $htmlTag = '<script type="text/javascript" ' . $tagAttribute . 'src="' . $file . '"></script>';
                }
                return $htmlTag . "\n";
                break;
            case 'css':
            case 'map':
                if (strrpos($tagAttribute, 'type=') !== false) {

                    $htmlTag = '<link ' . $tagAttribute . 'href="' . $file . '" />';
                } else {

                    $htmlTag = '<link type="text/css" ' . $tagAttribute . 'rel="stylesheet" href="' . $file . '" />';
                }
                unset($tagAttribute);
                return $htmlTag . "\n";
                break;
        }
    }

    /**
     *
     * Process files to be loaded from specified or default directory
     *
     * @access Public
     * @return Bool
     * @param Array | String $directories -> List of diretory in array or a single folder in string
     * @param Byte $loadCoreClass -> Switch loading default core library classes with 1 or 0.
     * Switching to 2 loads only folder files indicated in $directories parameter and creates
     * new objects of them
     *
     **/
    public function load_files($directories = null, $loadCoreClass = 0)
    {

        if (!empty($directories)) {
            $this->_directories = $directories;
        }

        $loadCoreClass != 2 ? $this->_set_unload_files() : null;

        if (!is_array($this->_directories)) {

            if (!is_dir($this->_directories)) {

                // log here: Invalid folder value, folders input not array
                return false;
            }
            $files = $this->_get_directory_files($this->_directories);
            $this->_load_file($files, $loadCoreClass);
            if ($loadCoreClass == 2) {return $this->instantiateClass;}
            return true;
        } else {

            foreach ($this->_directories as $directory) {
                $files = $this->_get_directory_files($directory);
                $this->_load_file($files, $loadCoreClass);
            }
            return true;
        }
    }

    /**
     *
     * load files and instantiate loaded classes
     *
     * @access Private
     * @return Bool
     * @param Array $files -> Folder's files to be loaded
     *
     **/
    private function _load_file($files = null, $loadCoreClass = 0)
    {
        $listClass = [];

        foreach ($files as $file) {

            if (is_array($file)) {
                $this->_load_file($file, $loadCoreClass);
            } else {
                if (mime_content_type($file) != 'text/plain') {

                    if (file_exists($file)) {

                        $fileName = basename($file);
                        $dirName = dirname($file) . '/';
                        // echo $fileName . "<br>";
                        // echo $dirName . "<br>";
                        // var_dump($this->_unloadFiles);

                        if ($loadCoreClass == 2) {
                            $this->_include_file($file);
                            $fileNameArr = explode('.', ucfirst($fileName));
                            $this->instantiateClass = [strtolower($fileNameArr[0]) => ${strtolower($fileNameArr[0])} = new $fileNameArr[0]];

                        } else {
                            if (!in_array($fileName, $this->_unloadFiles) && !in_array($dirName, $this->_unloadFiles)) {

                                $fileExtension = pathinfo($file, PATHINFO_EXTENSION);

                                if ($fileExtension == 'cfg') {

                                    $getName = pathinfo($file, PATHINFO_FILENAME);

                                    if (!in_array($getName, ['app', 'autoload'])) {

                                        $strVariable = $getName . 'Config';
                                        $strCapVariable = strtoupper('Fynx_' . $strVariable);
                                        ${$strVariable} = $this->_include_file($file, true);

                                        if (!defined($strCapVariable)) {

                                            define($strCapVariable, ${$strVariable});
                                        }
                                    }
                                } else {
                                    // echo $file . "<br>";
                                    $this->_include_file($file);
                                }

                                if ($loadCoreClass == 1) {
                                    if (array_key_exists($fileName, $this->_autoloadConfig['load_class'])) {

                                        $this->_include_file($file);
                                        ${lcfirst($this->_autoloadConfig['load_class'][$fileName])} = new $this->_autoloadConfig['load_class'][$fileName];
                                        $this->instantiateClass[lcfirst($this->_autoloadConfig['load_class'][$fileName])] = ${lcfirst($this->_autoloadConfig['load_class'][$fileName])};
                                    }
                                } else {
                                    return false;
                                }
                            }
                        }

                    }
                }
            }
        }
    }

    private function _set_unload_files($arrayFile = null)
    {

        if (is_null($arrayFile)) {
            $arrayFile = $this->_autoloadConfig['unload_files'];
        }

        if (is_array($arrayFile)) {
            $this->_unloadFiles = array_unique($arrayFile);
        }

        return false;
    }

    private function _get_filenames($files)
    {

        if (is_array($files)) {

            foreach ($files as $file) {

                if (is_array($file)) {
                    $filenames = $this->_get_filenames($file);
                } else {
                    $filenames[] = basename($file);
                }
            }
        } else {

            $filenames = basename($files);
        }
        return $filenames;
    }

    /**
     *
     * Select load type
     *
     * @access Private
     * @param Array $file -> File to be loaded
     * @param Array $return -> File to be loaded
     *
     **/
    private function _include_file($file, $return = false)
    {
        // $loadType = strtolower( $this->_loadType );

        switch (strtolower($this->_loadType)) {
            case 'include':
                // if ( $return === TRUE ) {
                //     return include( $file );
                // } else {
                include $file;
                // }
                break;
            case 'include_once':
                // if ( $return === TRUE ) {
                //     return include_once( $file );
                // } else {
                include_once $file;
                // }
                break;
            case 'require':
                // if ( $return === TRUE ) {
                //     return require( $file );
                // } else {
                require $file;
                // }
                break;
            case 'require_once':
                if ($return === true) {
                    return require_once $file;
                } else {
                    require_once $file;
                }
                break;
        }
    }

    /**
     *
     * Get all files in a directory/folder
     *
     * @access Private
     * @return Array
     * @param String $dirPath -> Directory/folder path
     *
     **/
    private function _get_directory_files($dirPath, $level = 0)
    {

        if (!is_dir($dirPath)) {
            // log here: Invalid folder value, folders input not array
            return false;
        }

        $files = array();
        $getFiles = scandir($dirPath);

        foreach ($getFiles as $key => $value) {

            if (!in_array($value, array(".", ".."))) {

                $file = str_replace("//", "/", $dirPath . '/' . $value);

                if (is_dir($file)) {

                    $files[$value] = $this->_get_directory_files($file);
                } else {

                    $files[] = $file;
                }
            }
        }
        return $files;
    }
}

// Instantiate the autoloader class
$autoLoader = new Autoloader;