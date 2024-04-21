<!-- BEGIN SIDEBPANEL-->
<nav class="page-sidebar" data-pages="sidebar">
    <!-- BEGIN SIDEBAR MENU TOP TRAY CONTENT-->
    <div class="sidebar-overlay-slide from-top" id="appMenu">
        <div class="row">
            <div class="col-xs-6 no-padding">
                <a href="#" class="p-l-40"><img
                        src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/demo/social_app.svg" alt="socail">
                </a>
            </div>
            <div class="col-xs-6 no-padding">
                <a href="#" class="p-l-10"><img
                        src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/demo/email_app.svg" alt="socail">
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 m-t-20 no-padding">
                <a href="#" class="p-l-40"><img
                        src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/demo/calendar_app.svg" alt="socail">
                </a>
            </div>
            <div class="col-xs-6 m-t-20 no-padding">
                <a href="#" class="p-l-10"><img
                        src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/demo/add_more.svg" alt="socail">
                </a>
            </div>
        </div>
    </div>
    <!-- END SIDEBAR MENU TOP TRAY CONTENT-->
    <!-- BEGIN SIDEBAR MENU HEADER-->
    <div class="sidebar-header">
        <img src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo_white.png" alt="logo" class="brand"
            data-src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo_white.png"
            data-src-retina="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo_white_2x.png" width="78"
            height="22">
        <div class="sidebar-header-controls">
            <button aria-label="Toggle Drawer" type="button"
                class="btn btn-icon-link invert sidebar-slide-toggle m-l-20 m-r-10" data-pages-toggle="#appMenu">
                <i class="pg-icon">chevron_down</i>
            </button>
            <button aria-label="Pin Menu" type="button"
                class="btn btn-icon-link invert d-lg-inline-block d-xlg-inline-block d-md-inline-block d-sm-none d-none"
                data-toggle-pin="sidebar">
                <i class="pg-icon"></i>
            </button>
        </div>
    </div>
    <!-- END SIDEBAR MENU HEADER-->

    <?php switch ($_SESSION['user_session']['user_role']) {
    case '1':
        $is_admin = 'NIL';
        break;
    case '3':
        $is_admin = '0';
        break;
    default:
        $is_admin = '1';
        break;}?>

    <!-- START SIDEBAR MENU -->
    <div class="sidebar-menu">
        <!-- BEGIN SIDEBAR MENU ITEMS-->
        <ul class="menu-items">
            <div class="m-t-20 "></div>
            <?php foreach ($this->clusters->get_menu($is_admin, '1', 'name,short_code,img') as $key => $value) {?>
            <li>
                <a href="<?=empty($value['main']['short_code']) ? 'javascript:void(0);' : FYNX_PUBLIC['url'] . $value['main']['short_code']?>"
                    class="">
                    <span class="title"><?=$value['main']['name']?></span>
                    <?=!empty($value['sub']) ? '<span class=" arrow"></span>' : null?>
                </a>
                <span class="icon-thumbnail"><?=$value['main']['img']?></span>
                <?php if (!empty($value['sub'])) {?>
                <ul class="sub-menu">
                    <?php foreach ($value['sub'] as $sub_key => $sub) {?>
                    <li class="">
                        <a
                            href="<?=empty($sub['short_code']) ? 'javascript:void(0);' : FYNX_PUBLIC['url'] . $sub['short_code']?>"><?=$sub['name']?></a>
                        <span class="icon-thumbnail"><?=$sub['img']?></span>
                    </li>
                    <?php }?>
                </ul>
                <?php }?>
            </li>
            <?php }?>
        </ul>
        <div class="clearfix"></div>
    </div>
    <!-- END SIDEBAR MENU -->
</nav>
<!-- END SIDEBAR -->
<!-- END SIDEBPANEL-->