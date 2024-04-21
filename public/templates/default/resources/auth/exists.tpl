<!-- [begin-extend-template]resources/auth/layouts/master[end] -->

<div class="login-wrapper"
    style="background-image:url(<?=FYNX_PUBLIC['media_url']?>frontend/slide-2.jpg); background-size:cover;background-repeat:no-repeat;">
    <!-- START Login Background Pic Wrapper-->
    <div class="bg-pic">
        <!-- START Background Caption-->
        <div class="bg-caption pull-bottom sm-pull-bottom text-white p-l-20 m-b-20">
            <h1 class="semi-bold text-white">Learning by Doing in the STVDI World</h1>
            <p class="small">©2023-2026 All Rights Reserved. STVDI® is a registered trademark of Jencube Ltd.</p>
        </div>
        <!-- END Background Caption-->
    </div>
    <!-- END Login Background Pic Wrapper-->
    <!-- START Login Right Container-->
    <div class="login-container bg-white">
        <ul class="pages-menu m-t-30 d-flex justify-content-center list-inline">
            <li class="pt-1 pb-1"><a href="#">About</a></li>
            <li class="pt-1 pb-1"><a href="#">Pricing</a></li>
            <li class="pt-1 pb-1"><a href="#">Blog</a></li>
        </ul>
        <div class="p-l-50 p-r-50 p-t-50 sm-p-l-15 sm-p-r-15 sm-p-t-40">
            <img src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo-48x48_c.png" alt="logo"
                data-src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo-48x48_c.png"
                data-src-retina="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo-48x48_c@2x.png" width="48"
                height="48">
            <h2 class="p-t-25">Sign-In to Your Account</h2>
            <p class="mw-80 m-t-5">Enjoy the best of our educational services as you Sign-in to your account</p>
            <!-- START Login Form -->
            <form id="form-login" class="p-t-15" role="form" method="POST"
                action="<?=FYNX_PUBLIC['url'] . 'auth/sessionexist'?>">
                <input type="hidden" name="data" value="<?=$data?>" />
                <!-- START Form Control-->
                <div class="form-group form-group-default">
                    <label>Email or Username</label>
                    <div class="controls">
                        <input type="text" id="email" name="user_email"
                            value="<?=json_decode(base64_decode($data))->user_email?>" placeholder="User Name"
                            class="form-control" disabled>
                    </div>
                </div>
                <!-- END Form Control-->
                <div class="row">
                    <div class="col-md-6 no-padding sm-p-l-10">
                        <a href="<?=FYNX_PUBLIC['url'] . 'auth/signin/' . json_decode(base64_decode($data))->org_id?>"
                            class="btn btn-primary btn-lg btn-large m-t-10">Sign-In with Another Account</a>
                    </div>
                    <div class="col-md-6 d-flex align-items-center justify-content-end">
                        <button aria-label="" class="btn btn-primary btn-lg btn-large m-t-10" type="submit">Proceed to
                            Sign-In</button>
                    </div>
                </div>
                <!-- END Form Control-->
            </form>
            <!--END Login Form-->
        </div>
    </div>
    <!-- END Login Right Container-->
</div>