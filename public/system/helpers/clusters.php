<?php

class Clusters extends Helpers
{
    /*
    |--------------------------------------------------------------------------
    | Get Current Tenant Data
    |--------------------------------------------------------------------------
    |
    | Get the Tenant details currently in active
    |
     */
    public function get_tenant($id = null)
    {
        if (isset($_SESSION['currency'])) {
            if (isset($_SESSION['tenant']) && ($id != $_SESSION['tenant']['org_id'])) {
                unset($_SESSION['currency']);
            }
        }
        if (!is_null($id)) {
            $check_query = "SELECT * FROM fx_org WHERE org_id = '{$id}'";
            $check_tenant = $this->connect()->select_db()->query($check_query, ['method' => null, 'details' => true])->fetch();
            if (!empty($check_tenant)) {
                $_SESSION['tenant'] = [
                    'name' => $check_tenant[0]['name'],
                    'img' => $check_tenant[0]['img'],
                    'img_white' => $check_tenant[0]['img_white'],
                    'favicon' => $check_tenant[0]['favicon'],
                    'email' => $check_tenant[0]['email'],
                    'phone' => $check_tenant[0]['phone'],
                    'website' => $check_tenant[0]['website'],
                    'address' => $check_tenant[0]['address'],
                    'county' => $check_tenant[0]['county'],
                    'country' => $check_tenant[0]['country'],
                    'org_id' => $check_tenant[0]['org_id'],
                    'default_row_per_page' => (int) $check_tenant[0]['default_row_per_page'],
                    'default_template' => $check_tenant[0]['default_template'],
                    'default_theme' => $check_tenant[0]['default_theme'],
                    'frontend_template' => $check_tenant[0]['frontend_template'],
                    'frontend_theme' => $check_tenant[0]['frontend_theme'],
                ];
                return true;
            } else {return false;}
        }
    }

    /*
    |--------------------------------------------------------------------------
    | Get Currency Data
    |--------------------------------------------------------------------------
    |
    | Get your Currency Data from Database
    |
     */
    public function get_currencies($code = null, $tenant = null)
    {
        $is_default = null;
        if (!is_null($tenant)) {
            if (is_null($code)) {
                if (!isset($_SESSION['currency'])) {
                    $is_default = "SELECT code, name, symbol, rate FROM fx_currencies WHERE is_default = 'Yes' AND org_id = '{$tenant}'";
                }
            } else {
                $is_default = "SELECT code, name, ISO, symbol, rate FROM fx_currencies WHERE code = '{$code}' AND org_id = '{$tenant}'";
            }
        } else {
            $is_default = "SELECT code, name, ISO, symbol, rate FROM fx_currencies WHERE org_id = 'default'";
        }
        if (!is_null($is_default)) {
            $is_default_arr = $this->connect()->select_db()->query($is_default, ['method' => null, 'details' => true])->fetch();
            if (!empty($is_default_arr)) {
                $_SESSION['currency'] = [
                    'name' => $is_default_arr[0]['name'],
                    'code' => $is_default_arr[0]['code'],
                    'ISO' => $is_default_arr[0]['ISO'],
                    'symbol' => $is_default_arr[0]['symbol'],
                    'rate' => $is_default_arr[0]['rate'],
                ];
            } else {
                $is_default = "SELECT code, name, ISO, symbol, rate FROM fx_currencies WHERE org_id = 'default'";
                $is_default_arr = $this->connect()->select_db()->query($is_default, ['method' => null, 'details' => true])->fetch();
                $_SESSION['currency'] = [
                    'name' => $is_default_arr[0]['name'],
                    'code' => $is_default_arr[0]['code'],
                    'ISO' => $is_default_arr[0]['ISO'],
                    'symbol' => $is_default_arr[0]['symbol'],
                    'rate' => $is_default_arr[0]['rate'],
                ];
            }
        }
        $query = "SELECT code, symbol FROM fx_currencies WHERE is_active = 'Yes' AND org_id = '{$tenant}'";
        $currency_list_arr = $this->connect()->select_db()->query($query, ['method' => null, 'details' => true])->fetch();
        if (empty($currency_list_arr)) {
            $query = "SELECT code, symbol FROM fx_currencies WHERE is_active = 'Yes' AND org_id = 'default'";
            $currency_list_arr = $this->connect()->select_db()->query($query, ['method' => null, 'details' => true])->fetch();
        }
        return $currency_list_arr;
    }

    /*
    |--------------------------------------------------------------------------
    | Get Menu
    |--------------------------------------------------------------------------
    |
    | Generate your menu list
    |
     */
    // public function get_menu_type($user_type){
    //     switch ($user_type) {
    //         case '1':
    //             $this->is_admin = 'NIL';
    //             break;
    //         case '2':
    //             $this->is_admin = '1';
    //             break;
    //         case '3':
    //             $this->is_admin = '0';
    //             break;
    //     }
    //     return $this;
    // }

    public function get_menu($access = 'F', $view = '1', $filter = '*')
    {
        $menu = [];
        $filter = strpos($filter, 'main_order_id') !== false && $filter !== "*" ? $filter : 'main_order_id,' . $filter;
        $get_view = $view == 'all' ? '' : "AND get_view = '{$view}'";
        $main_menu_query = "SELECT {$filter} FROM fx_menu_main WHERE is_admin = '{$access}' {$get_view}";
        $main_menu_arr = $this->connect()->select_db()->query($main_menu_query, ['method' => null, 'details' => true])->fetch();
        if (!empty($main_menu_arr)) {
            foreach ($main_menu_arr as $main_val) {
                $main_id = $main_val['main_order_id'];
                $sub_menu_query = "SELECT {$filter} FROM fx_menu_sub WHERE main_order_id = '{$main_id}' {$get_view}";
                $sub_menu_arr = $this->connect()->select_db()->query($sub_menu_query, ['method' => null, 'details' => true])->fetch();
                array_push($menu, $main_val['name'] = ['main' => $main_val, 'sub' => $sub_menu_arr]);
            }
        }
        // var_dump($menu);
        // echo "<br><br><br><br>";
        return $menu;
    }
}