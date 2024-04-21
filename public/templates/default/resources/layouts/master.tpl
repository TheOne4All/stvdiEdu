<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title><?=FYNX_APP['name']?> - Dashboard</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, shrink-to-fit=no" />
    <link rel="apple-touch-icon" href="<?=FYNX_PUBLIC['template_url']?>default/pages/ico/60.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?=FYNX_PUBLIC['template_url']?>default/pages/ico/76.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?=FYNX_PUBLIC['template_url']?>default/pages/ico/120.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?=FYNX_PUBLIC['template_url']?>default/pages/ico/152.png">
    <link rel="icon" type="image/x-icon" href="favicon.ico" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-touch-fullscreen" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="default">
    <meta content="Meet pages - The simplest and fastest way to build web UI for your dashboard or app."
        name="description" />
    <meta content="Ace" name="author" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/pace/pace-theme-flash.css" rel="stylesheet"
        type="text/css" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"
        type="text/css" />
    <!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-scrollbar/jquery.scrollbar.css"
        rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/select2/css/select2.min.css" rel="stylesheet"
        type="text/css" media="screen" />
    <!-- <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/nvd3/nv.d3.min.css" rel="stylesheet"
        type="text/css" media="screen" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/mapplic/css/mapplic.css" rel="stylesheet"
        type="text/css" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/rickshaw/rickshaw.min.css" rel="stylesheet"
        type="text/css" /> -->
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/bootstrap-tag/bootstrap-tagsinput.css"
        rel="stylesheet" type="text/css" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/dropzone/css/dropzone.css" rel="stylesheet"
        type="text/css" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/daterangepicker/daterangepicker.css"
        rel="stylesheet" type="text/css" media="screen">
    <!--     <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/bootstrap-datepicker/css/datepicker3.css"
        rel="stylesheet" type="text/css" media="screen">
    <link
        href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"
        rel="stylesheet" type="text/css" media="screen">
    <link
        href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css"
        rel="stylesheet" type="text/css" media="screen">
<link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-metrojs/MetroJs.css" rel="stylesheet"
        type="text/css" media="screen" /> -->
    <link
        href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-datatable/media/css/dataTables.bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <link
        href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-datatable/extensions/FixedColumns/css/dataTables.fixedColumns.min.css"
        rel="stylesheet" type="text/css" />
    <link
        href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/datatables-responsive/css/datatables.responsive.css"
        rel="stylesheet" type="text/css" media="screen" />
    <link class="main-stylesheet" href="<?=FYNX_PUBLIC['template_url']?>default/pages/css/pages.css" rel="stylesheet"
        type="text/css" />

</head>

<body class="fixed-header dashboard">

    <!-- Side-bar Layout -->
    <?php require_once 'sidebar.tpl';?>

    <!-- Alert Display Notification -->
    <?php $this->alert($_GET);?>

    <!-- START PAGE-CONTAINER -->
    <div class="page-container ">

        <!-- Top-Bar Layout -->
        <?php require_once 'topbar.tpl';?>

        <div class="page-content-wrapper">

            <!-- Get Content -->
            <?php require_once $this->master_content;?>

            <!-- Footer Layout -->
            <?php require_once 'footer.tpl';?>

        </div>

    </div>
    <!-- END PAGE CONTAINER -->

    <!-- Quick-View Layout -->
    <?php require_once 'quickview.tpl';?>

    <!-- Search-Overlay Layout -->
    <?php require_once 'searchoverlay.tpl';?>

    <!-- JavaScript Library Layout -->
    <?php require_once 'scripts.tpl';?>

</body>

</html>