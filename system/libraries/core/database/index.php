<?php
//echo $_SERVER['SERVER_NAME'];
    echo '<br />';
    echo '<br />';
    echo '<br />';
    echo '<br />';
    echo '<br />';
    //echo dirname( __FILE__ );

    require_once( '../../../configs/app.cfg' );
    // include( '../User.lib' );
    //include( '../../../functions/sys.funct' );

    $database = $autoLoader->instantiateClass['fynxDatabase'];
    $database->query('SELECT * FROM `stv_org_user` ');
    var_dump($database->fetch());

    $user = new FynxUser();

    $data = [
        'username' => 'amaeze',
        'password' => '123456',
        'firstname' => 'Ama',
        'lastname' => 'Eze',
        'access' => 1,
        'email' => 'email@gmail.com',
        //'admin' => TRUE,
    ];
    
    //echo $user->register_user( $data );

    $data = [
        'username' => 'amaeze',
        'password' => '123456',        
    ];


    // if ( $user->is_login() )
    //     echo"yes";