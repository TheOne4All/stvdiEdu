<!-- [begin-extend-template]resources/auth/layouts/master[end] -->

<div class="register-container full-height sm-p-t-30">
    <div class="d-flex justify-content-center flex-column full-height ">
        <img src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo.png" alt="logo"
            data-src="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo.png"
            data-src-retina="<?=FYNX_PUBLIC['template_url']?>default/assets/img/logo_2x.png" width="78" height="22">
        <h3>Student Admission</h3>
        <p>Complete the admission form for the institution of your choice.</p>
        <form id="form-register" class="p-t-15" role="form" method="POST"
            action="<?=FYNX_PUBLIC['url'] . 'auth/admit/' . $tenantId?>">
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-group form-group-default required">
                        <label class="label-sm">First Name:</label>
                        <input type="text" placeholder="First Name" name="firstname" value="" class="form-control">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-default required">
                        <label class="label-sm">Last Name:</label>
                        <input type="text" placeholder="First Name" name="lastname" value="" class="form-control">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-group form-group-default">
                        <label class="label-sm">Middle Name:</label>
                        <input type="text" placeholder="First Name" name="middlename" value="" class="form-control">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-default input-group required">
                        <div class="form-input-group">
                            <label class="label-sm">Email:</label>
                            <input type="email" placeholder="xy@domain.xyz" name="email" value="" class="form-control">
                        </div>
                        <div class="input-group-append ">
                            <span class="input-group-text"><i class="pg-icon">@</i></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-group form-group-default input-group required">
                        <div class="form-input-group">
                            <label class="label-sm">Birth Date:</label>
                            <input type="text" class="form-control singleDatePicker" placeholder="Pick a date"
                                name="dob">
                        </div>
                        <div class="input-group-append ">
                            <span class="input-group-text"><i class="pg-icon">calendar</i></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-default input-group required">
                        <div class="form-input-group">
                            <label class="label-sm">Phone:</label>
                            <input type="phone" placeholder="234-803-111-1234" name="phone" value=""
                                class="form-control">
                        </div>
                        <div class="input-group-append ">
                            <span class="input-group-text"><i class="pg-icon">chat</i></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-group form-group-default required">
                        <label class="label-sm" for="class_id">Class:</label>
                        <select class="form-control full-width selectElement" id="class_id" name="class_id">
                            <option value="JSS1">JSS1</option>
                            <option value="JSS2">Jss2</option>
                            <option value="SSS1">SSS1</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group form-group-default">
                        <label class="label-sm" for="section_id">Section:</label>
                        <select class="form-control full-width" id="section_id" name="section_id">
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-4">
                    <div class="form-group form-group-default">
                        <label class="label-sm" for="category_id">Category</label>
                        <select class="form-control full-width" id="category_id" name="category_id">
                            <option value="FT">Full-Time</option>
                            <option value="PT">Part-Time</option>
                            <option value="VT">Virtual</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group form-group-default">
                        <label class="label-sm" for="gender">Gender</label>
                        <select class="form-control full-width" id="gender" name="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group form-group-default">
                        <label class="label-sm">Religion:</label>
                        <input type="text" placeholder="eg. Christian" name="religion" value="" class="form-control">
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-lg-6">
                    <p><small>I agree to the <a href="#" class="text-info">Pages Terms</a> and <a href="#"
                                class="text-info">Privacy</a>.</small></p>
                </div>
                <div class="col-lg-6 text-right">
                    <a href="<?=FYNX_PUBLIC['url'] . 'auth/signin/' . $tenantId?>" class="text-info small">Back to
                        Sign-In</a>
                </div>
            </div>
            <div class="form-row m-t-10">
                <div class="col">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Submit
                        Admission Form</button>
                </div>
            </div>
        </form>
    </div>
</div>