<!-- [begin-extend-template]resources/auth/layouts/master[end] -->

<div class="register-container full-height sm-p-t-30">
    <div class="d-flex justify-content-center flex-column full-height ">
        <img src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo.png" alt="logo"
            data-src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo.png"
            data-src-retina="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo_2x.png" width="78" height="22">
        <h3>Sign-Up an Account</h3>
        <p>
            Create a pages account. If you have a facebook account, log into it for this process. Sign in with <a
                href="#" class="text-info">Facebook</a> or <a href="#" class="text-info">Google</a>
        </p>
        <form id="form-register" class="p-t-15" role="form" method="POST"
            action="<?=FYNX_PUBLIC['url'] . 'auth/register/0/0'?>">
            <input type="hidden" name="access" value="2" />
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-group-default">
                        <label>First Name</label>
                        <input type="text" id="firstname" name="firstname" placeholder="John" class="form-control"
                            required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-default">
                        <label>Last Names</label>
                        <input type="text" id="lastname" name="lastname" placeholder="Smith" class="form-control"
                            required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group form-group-default">
                        <label>Institution Name</label>
                        <input type="text" id="cname" name="cname" placeholder="Jencube Educational Center"
                            class="form-control" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group form-group-default">
                        <label>Unique-ID</label>
                        <input type="text" id="org_id" name="org_id" placeholder="Enter Unique-ID" class="form-control"
                            required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-default">
                        <label>Email</label>
                        <input type="email" id="user_email" name="user_email" placeholder="{name}@{domain-name}.{ext}"
                            class="form-control" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group form-group-default">
                        <label>Password</label>
                        <input type="password" id="password" name="password" placeholder="Minimum of 4 Charactors"
                            class="form-control" required>
                    </div>
                </div>
            </div>
            <div class="row m-t-10">
                <div class="col-lg-6">
                    <p><small>I agree to the <a href="#" class="text-info">Pages Terms</a> and <a href="#"
                                class="text-info">Privacy</a>.</small></p>
                </div>
                <div class="col-lg-6 text-right">
                    <a href="#" class="text-info small">Help? Contact Support</a>
                </div>
            </div>
            <button aria-label="" class="btn btn-primary btn-cons btn-lg btn-larger m-t-10" type="submit">Create a new
                account</button>
        </form>
    </div>
</div>