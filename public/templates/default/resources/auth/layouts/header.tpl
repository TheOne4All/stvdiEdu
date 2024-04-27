<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>Pages - Admin Dashboard UI Kit - Lock Screen</title>
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

    <!-- Icons -->
    <link rel="stylesheet" href="<?=FYNX_PUBLIC['template_url']?>default/assets/fonts/fontawesome.css" />
    <link rel="stylesheet" href="<?=FYNX_PUBLIC['template_url']?>default/assets/fonts/tabler-icons.css" />
    <link rel="stylesheet" href="<?=FYNX_PUBLIC['template_url']?>default/assets/fonts/flag-icons.css" />

    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-scrollbar/jquery.scrollbar.css"
        rel="stylesheet" type="text/css" media="screen" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/select2/css/select2.min.css" rel="stylesheet"
        type="text/css" media="screen" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/dropzone/css/dropzone.css" rel="stylesheet"
        type="text/css" />
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/daterangepicker/daterangepicker.css"
        rel="stylesheet" type="text/css" media="screen">
    <link class="main-stylesheet" href="<?=FYNX_PUBLIC['template_url']?>default/pages/css/pages.css" rel="stylesheet"
        type="text/css" />
    <!-- Please remove the file below for production: Contains demo classes -->
    <link class="main-stylesheet" href="<?=FYNX_PUBLIC['template_url']?>default/assets/css/style.css" rel="stylesheet"
        type="text/css" />
    <style>
    .alert-display {
        position: fixed;
        overflow: hidden;
        font-size: 14px;
        width: 300px;
        min-height: auto;
        padding: 15px;
        margin-top: -40px;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        text-align: center;
        border-bottom-right-radius: 10px;
        border-bottom-left-radius: 10px;
        z-index: 999999999;
        -moz-animation: 5s slideDownUp ease-in-out;
        /* Firefox */
        -webkit-animation: 5s slideDownUp ease-in-out;
        /* Safari and Chrome */
        -o-animation: 5s slideDownUp ease-in-out;
        /* Opera */
        animation: 5s slideDownUp ease-in-out;
    }

    @keyframes slideDownUp {
        0% {
            margin-top: -40px;
        }

        25% {
            margin-top: 25px;
        }

        75% {
            margin-top: 25px;
        }

        100% {
            margin-top: -40px;
        }
    }

    @-webkit-keyframes slideDownUp {
        0% {
            margin-top: -40px;
        }

        25% {
            margin-top: 25px;
        }

        75% {
            margin-top: 25px;
        }

        100% {
            margin-top: -40px;
        }
    }

    @-moz-keyframes slideDownUp {
        0% {
            margin-top: -40px;
        }

        25% {
            margin-top: 25px;
        }

        75% {
            margin-top: 25px;
        }

        100% {
            margin-top: -40px;
        }
    }

    @-o-keyframes slideDownUp {
        0% {
            margin-top: -40px;
        }

        25% {
            margin-top: 25px;
        }

        75% {
            margin-top: 25px;
        }

        100% {
            margin-top: -40px;
        }
    }
    </style>
    <script type="text/javascript">
    window.onload = function() {
        // fix for windows 8
        if (navigator.appVersion.indexOf("Windows NT 6.2") != -1)
            document.head.innerHTML +=
            '<link rel="stylesheet" type="text/css" href="<?=FYNX_PUBLIC['template_url']?>default/pages/css/windows.chrome.fix.css" />'
    }
    </script>
</head>