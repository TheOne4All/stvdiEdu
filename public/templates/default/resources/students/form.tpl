<?=isset($user_id) ? '<input type="hidden" name="user_id" value="' . $user_id . '">' : null?>


<!-- <div class="d-flex justify-content-center flex-column full-height ">
    <div class="row">
        <div class="col-md-4">
            <div class="form-group form-group-default">
                <label class="label-sm">First Name:</label>
                <input type="text" placeholder="First Name" name="firstname"
                    value="<?=isset($firstname) ? $firstname : ''?>" class="form-control">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group form-group-default">
                <label class="label-sm">Last Name:</label>
                <input type="text" placeholder="First Name" name="lastname"
                    value="<?=isset($lastname) ? $lastname : ''?>" class="form-control">
            </div>
        </div>
        <div class="col-md-4">
            <div class="form-group form-group-default">
                <label class="label-sm">Middle Name:</label>
                <input type="text" placeholder="First Name" name="middlename"
                    value="<?=isset($middlename) ? $middlename : ''?>" class="form-control">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-group form-group-default">
                <label>Institution Name</label>
                <input type="text" id="cname" name="cname" placeholder="Jencube Educational Center" class="form-control"
                    required>
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
</div> -->




<div class="card card-default">
    <div class="card-header ">
        <div class="card-title">Student Details</div>
    </div>
    <div class="card-body">
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">First Name:</label>
                    <input type="text" placeholder="First Name" name="firstname"
                        value="<?=isset($firstname) ? $firstname : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Last Name:</label>
                    <input type="text" placeholder="First Name" name="lastname"
                        value="<?=isset($lastname) ? $lastname : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Middle Name:</label>
                    <input type="text" placeholder="First Name" name="middlename"
                        value="<?=isset($middlename) ? $middlename : ''?>" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Admission No:</label>
                    <input type="text" placeholder="Admission Number" name="admission_no"
                        value="<?=isset($admission_no) ? $admission_no : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="class_id">Class:</label>
                    <select class="form-control full-width" id="class_id" name="class_id">
                        <option value="JSS1">JSS1</option>
                        <option value="JSS2">Jss2</option>
                        <option value="SSS1">SSS1</option>
                    </select>
                </div>
            </div>
            <div class="col-md-4">
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
                    <label class="label-sm" for="category">Gender</label>
                    <select class="form-control full-width" id="gender" name="gender">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Religion:</label>
                    <input type="text" placeholder="eg. Christian" name="religion"
                        value="<?=isset($religion) ? $religion : ''?>" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Birth Date:</label>
                        <input type="text" class="form-control singleDatePicker" placeholder="Pick a date" name="dob">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">calendar</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Email:</label>
                        <input type="email" placeholder="xy@domain.xyz" name="email"
                            value="<?=isset($email) ? $email : ''?>" class="form-control">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">@</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Phone:</label>
                        <input type="phone" placeholder="234-803-111-1234" name="phone"
                            value="<?=isset($phone) ? $phone : ''?>" class="form-control">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">chat</i></span>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Admission Date:</label>
                        <input type="text" class="form-control singleDatePicker" placeholder="Pick a date"
                            name="admission_date">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">calendar</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="blood_group">Blood Group:</label>
                    <select class="form-control full-width" id="blood_group" name="blood_group">
                        <option value="O+">O+</option>
                        <option value="A+">A+</option>
                        <option value="B+">B+</option>
                        <option value="AB+">AB+</option>
                        <option value="O-">O-</option>
                        <option value="A-">A-</option>
                        <option value="B-">B-</option>
                        <option value="AB-">AB-</option>
                    </select>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="sibling_id">Any Siblings?:</label>
                    <select class="form-control full-width" id="sibling_id" name="sibling_id">
                    </select>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="img">Student Photo:</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="img" name="img">
                            <label class="custom-file-label" for="image">Choose file</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-header ">
        <div class="card-title">Guardian Details</div>
    </div>
    <div class="card-body">
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Father's Name:</label>
                    <input type="text" placeholder="Father's Name" name="father_name"
                        value="<?=isset($father_name) ? $father_name : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Father's Phone:</label>
                        <input type="phone" placeholder="234-803-111-1234" name="father_phone"
                            value="<?=isset($father_phone) ? $father_phone : ''?>" class="form-control">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">chat</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Father's Occupation:</label>
                    <input type="text" placeholder="Father's Occupation" name="father_occupation"
                        value="<?=isset($father_occupation) ? $father_occupation : ''?>" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Mother's Name:</label>
                    <input type="text" placeholder="mother's Name" name="mother_name"
                        value="<?=isset($mother_name) ? $mother_name : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Mother's Phone:</label>
                        <input type="phone" placeholder="234-803-111-1234" name="mother_phone"
                            value="<?=isset($mother_phone) ? $mother_phone : ''?>" class="form-control">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">chat</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Mother's Occupation:</label>
                    <input type="text" placeholder="mother's Occupation" name="mother_occupation"
                        value="<?=isset($mother_occupation) ? $mother_occupation : ''?>" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-3">
                <label class="small-text bold">is Guardian:</label>
            </div>
            <div class="col-md-3">
                <div class="form-check primary">
                    <input type="radio" name="texture" id="radio0" name="is_guardian" value="Verbose">
                    <label for="radio0" class="small-text bold">Someone else</label>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-check primary">
                    <input type="radio" name="texture" id="radio2" name="is_guardian" value="Verbose">
                    <label for="radio2" class="small-text bold">Father</label>
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-check primary">
                    <input type="radio" name="texture" id="radio2" name="is_guardian" value="Verbose">
                    <label for="radio2" class="small-text bold">Mother</label>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Guardian's Name:</label>
                    <input type="text" placeholder="Guardian's Name" name="guardian_name"
                        value="<?=isset($guardian_name) ? $guardian_name : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Guardian's Phone:</label>
                        <input type="phone" placeholder="234-803-111-1234" name="guardian_phone"
                            value="<?=isset($guardian_phone) ? $guardian_phone : ''?>" class="form-control">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">chat</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Guardian's Occupation:</label>
                    <input type="text" placeholder="Guardian's Occupation" name="guardian_occupation"
                        value="<?=isset($guardian_occupation) ? $guardian_occupation : ''?>" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Relationship:</label>
                    <input type="text" placeholder="Guardian's Relationship" name="guardian_relation"
                        value="<?=isset($guardian_relation) ? $guardian_relation : ''?>" class="form-control">
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default input-group">
                    <div class="form-input-group">
                        <label class="label-sm">Guardian's Email:</label>
                        <input type="email" placeholder="xy@domain.xyz" name="guardian_email"
                            value="<?=isset($guardian_email) ? $guardian_email : ''?>" class="form-control">
                    </div>
                    <div class="input-group-append ">
                        <span class="input-group-text"><i class="pg-icon">@</i></span>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm">Guardian's Address:</label>
                    <input type="text" placeholder="Guardian's Address" name="guardian_address"
                        value="<?=isset($guardian_address) ? $guardian_address : ''?>" class="form-control">
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="father_pic">Father's Photo:</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="father_pic" name="father_pic">
                            <label class="custom-file-label" for="image">Choose file</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="mother_pic">Mother's Photo:</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="mother_pic" name="mother_pic">
                            <label class="custom-file-label" for="image">Choose file</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group form-group-default">
                    <label class="label-sm" for="guardian_pic">Guardian's Photo:</label>
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="guardian_pic" name="guardian_pic">
                            <label class="custom-file-label" for="image">Choose file</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-row m-t-10">
            <div class="col">
                <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
            </div>
        </div>
    </div>
</div>