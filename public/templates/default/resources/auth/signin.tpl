<!-- [begin-extend-template]resources/auth/layouts/master[end] -->

<div class="login-wrapper"
    style="background-image:url(<?=FYNX_PUBLIC['media_url']?>frontend/slide-1.jpg); background-size:cover;background-repeat:no-repeat;">
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
                action="<?=FYNX_PUBLIC['url'] . 'auth/login'?>">
                <input type="hidden" name="org_id" value="<?=$tenantId?>" />
                <!-- START Form Control-->
                <div class="form-group form-group-default">
                    <label>Email</label>
                    <div class="controls">
                        <input type="text" id="email" name="user_email" placeholder="User Name" class="form-control"
                            required>
                    </div>
                </div>
                <!-- END Form Control-->
                <!-- START Form Control-->
                <div class="form-group form-group-default">
                    <label>Password</label>
                    <div class="controls">
                        <input type="password" class="form-control" id="password" name="password"
                            placeholder="Credentials" required>
                    </div>
                </div>
                <!-- START Form Control-->
                <div class="row">
                    <div class="col-md-6 no-padding sm-p-l-10">
                        <div class="form-check">
                            <input type="checkbox" value="1" id="checkbox1">
                            <label for="checkbox1">Remember me</label>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex align-items-center justify-content-end">
                        <button aria-label="" class="btn btn-primary btn-cons btn-lg btn-large m-t-10"
                            type="submit">Sign
                            in</button>
                    </div>
                </div>
                <div class="m-b-5 m-t-30">
                    <a href="#" class="normal">Lost your password?</a>
                </div>
                <div>
                    <a href="<?=FYNX_PUBLIC['url'] . 'auth/signup'?>" class="normal">Not a member yet? Signup now.</a>
                </div>
                <!-- END Form Control-->

                <div class="divider my-4">
                    <div class="divider-text">or</div>
                </div>

                <div class="d-flex justify-content-center">
                    <a href="javascript:;" class="btn btn-icon btn-label-facebook mr-3">
                        <i class="tf-icons fa-brands fa-facebook-f fs-5 p-1"></i>
                    </a>

                    <a href="javascript:;" class="btn btn-icon btn-label-google-plus mr-3">
                        <i class="tf-icons fa-brands fa-google fs-5 p-1"></i>
                    </a>

                    <a href="javascript:;" class="btn btn-icon btn-label-jencube mr-3">
                        <img src="<?=FYNX_PUBLIC['media_url']?>frontend/jencube_logo.png" class=" fs-5 p-1" />
                    </a>
                </div>
            </form>
            <!--END Login Form-->
        </div>
    </div>
    <!-- END Login Right Container-->
</div>