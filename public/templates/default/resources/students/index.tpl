<!-- [begin-extend-template]resources/layouts/master[end] -->

<style>
.modal-custom {
    padding: 0 !important;
}

.modal-custom .modal-dialog {
    width: 900px;
}
</style>

<?php

$createStudent = [
    'name' => 'createStudent',
    'header' => '<h5>Add Student</h5>',
    'file' => 'students/form.tpl',
    'url' => FYNX_PUBLIC['url'] . 'students/create',
    'classlist' => ['slide-up', 'modal-custom'],
    'xbutton' => '<i class="pg-icon">close</i>',
    'size' => 'lg',
];
$this->modal($createStudent)->modal_end();

$updateStudent = [
    'name' => 'updateStudent',
    'header' => '<h5>Edit Student</h5>',
    'file' => 'students/form.tpl',
    'url' => FYNX_PUBLIC['url'] . 'students/update',
    'classlist' => ['slide-up', 'modal-custom'],
    'xbutton' => '<i class="pg-icon">close</i>',
    'size' => 'lg',
];

$deleteStudent = [
    'name' => 'deleteStudent',
    'header' => '<h5>Delete Student</h5>',
    'url' => FYNX_PUBLIC['url'] . 'students/delete',
    'body' => '<p>Are you sure you want to proceed?</p>
    <button type="submit" class="btn btn-primary btn-block">Continue</button>
    <button class="btn btn-default btn-block" data-dismiss="modal">Cancel</button>',
    'classlist' => ['stick-up'],
    'xbutton' => '<i class="pg-icon">close</i>',
    'size' => 'sm',
];

$settings = [
    'total_results' => $allStudents, // Total Record found via query
    'total_results_count' => empty($allStudentsCount) ? 0 : $allStudentsCount, // Total Record count found via query
    'list_per_page' => $_SESSION['tenant']['default_row_per_page'], // Number of record to display per page. Default is 25
    'current_page' => isset($currentPage) ? $currentPage : 1,
    'type' => 'list_link', // eg link, input, load_more, list_link, input_limit, list
    'page_url' => FYNX_PUBLIC['url'] . 'students/index', // Optional: URL link, default is # if not provided
    'prev_btn' => '<i class="pg-icon">chevron_left</i>', // Optional: To Change the previous button text. Default is "Previous"
    'next_btn' => '<i class="pg-icon">chevron_right</i>', // Optional: To Change the next button text. Default is "Next"
    'first_btn' => '', // Optional: To Change the first button text. Default is "First"
    'last_btn' => '', // Optional: To Change the last button text. Default is "Last"
    'load_more' => '', // Optional: To Change the Load More button text. Default text is "Load More" like twitter back in the days
    'done_loading' => '', // Optional: To Change the Done Loading button text, this is when all query record is display and there isn't any record, it is works with Load More Button. Default text is "Done Loading"
    'input_text' => '', // Optional: To Change the Page title text. Default is "Page:"
];

$this->pagination->load($settings);
$pageRecords = $this->pagination->get_page_records();

if (isset($_SESSION['search_filter']['search_table'])) {
    $search_table = $_SESSION['search_filter']['search_table'];
    $search_table_html = '<strong class="text-danger">' . $_SESSION['search_filter']['search_table'] . '</strong>';
} else {
    $search_table = $search_table_html = '';
}

?>

<!-- START PAGE CONTENT -->
<div class="content">
    <!-- START PAGE COVER -->
    <div class="container-fluid   container-fixed-lg">
        <div class="card-transparent">
            <div class="card-body row">
                <!-- START BREADCRUMB -->
                <div class="col-6 p-t-10 p-b-10 detailed">
                    <h3 class="page-title m-b-0">List Students</h3>
                    <span class="details">List/Add/Edit all records of Students on current active session</span>
                </div>
                <ul class="col-6 breadcrumb p-l-0 justify-content-end align-items-center">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">List Students</li>
                </ul>
                <!-- END BREADCRUMB -->
            </div>
        </div>
    </div>
    <!-- START CONTAINER FLUID -->
    <div class=" container-fluid   container-fixed-lg bg-white">
        <!-- START card -->
        <div class="card card-transparent">
            <div class="card-header row">
                <div class="col-sm-1">
                    <select id="entry" name="entry" class="cs-select cs-skin-slide" data-init-plugin="cs-select"
                        data-url="<?=FYNX_PUBLIC['url'] . 'students/index/1'?>">
                        <option value="10" <?=$_SESSION['tenant']['default_row_per_page'] == 10 ? 'selected' : null?>>
                            10
                        </option>
                        <option value="25" <?=$_SESSION['tenant']['default_row_per_page'] == 25 ? 'selected' : null?>>
                            25
                        </option>
                        <option value="50" <?=$_SESSION['tenant']['default_row_per_page'] == 50 ? 'selected' : null?>>
                            50
                        </option>
                        <option value="100" <?=$_SESSION['tenant']['default_row_per_page'] == 100 ? 'selected' : null?>>
                            100
                        </option>
                    </select>
                </div>
                <div class="col-sm-5"></div>
                <div class="col-sm-6 d-flex justify-content-end align-items-center">
                    <span class="ml-2">
                        <form method="POST" enctype="multipart/form-data"
                            action="<?=FYNX_PUBLIC['url']?>students/index">
                            <input type="text" name="search_table"
                                value="<?php if (isset($_SESSION['search_filter']['search_table'])) {echo $_SESSION['search_filter']['search_table'];}?>"
                                placeholder="Search" class="form-control d-inline w-auto">
                        </form>
                    </span>
                    <span class="ml-2 dropdown">
                        <button class="btn btn-danger btn-lg dropdown-toggle" type="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">Export</button>
                        <div class="dropdown-menu p-2">
                            <a class="btn btn-default btn-block text-center"
                                onclick="window.print()"><small>PRINT</small></a>
                            <a class="btn btn-default btn-block text-center" href="#"><small>CSV</small></a>
                            <a class="btn btn-default btn-block text-center" href="#"><small>PDF</small></a>
                        </div>
                    </span>
                    <span class="ml-2"><button class="btn btn-primary btn-lg btn-larger" data-toggle="modal"
                            data-target="#createStudent"><i class="pg-icon">plus</i> Add Student</button></span>
                </div>
                <!-- <div class="clearfix"></div> -->
            </div>
            <div class="card-body table-responsive">
                <table class="table table-striped" id="tableWithExportOptions">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="selectAll" name="selectAll"></th>
                            <th class="bold">FullName</th>
                            <th class="bold">Email</th>
                            <th class="bold">Phone</th>
                            <th class="bold">Entry</th>
                            <th class="bold">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php if (!empty($pageRecords)) {foreach ($pageRecords as $key => $value) {?>

                        <tr class="odd gradeX">
                            <td><input type="checkbox" class="checkBoxClass" name="user_id[]"
                                    value="<?=$value['user_id']?>"></td>
                            <td class="">
                                <?php echo $value['lastname'] . ", " . $value['firstname'] . " " . $value['middlename']; ?>
                            </td>
                            <td class=""><?php echo $value['email']; ?></td>
                            <td class=""><?php echo $value['phone']; ?></td>
                            <td class=""><?php echo $value['created_at']; ?></td>
                            <td>
                                <div class="dropdown">
                                    <button class="btn dropdown-toggle border-0 bg-transparent" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false"><i
                                            class="pg-icon">list_bullets</i></button>
                                    <div class="dropdown-menu p-2">
                                        <button class="btn btn-primary btn-block btn-lg justify-content-start"
                                            data-toggle="modal" data-target="#readStudent<?=$key?>"><i
                                                class="pg-icon mr-2">eye</i>View</button>
                                        <button class="btn btn-primary btn-block btn-lg justify-content-start"
                                            data-toggle="modal" data-target="#updateStudent<?=$key?>"><i
                                                class="pg-icon mr-2">edit</i>Edit</button>
                                        <button class="btn btn-primary btn-block btn-lg justify-content-start"
                                            data-toggle="modal" data-target="#deleteStudent<?=$key?>"><i
                                                class="pg-icon mr-2">bin</i>Delete</button>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <?php //$this->modal($readStudent, $key)->modal_end();
    $this->modal($updateStudent, $key)->modal_end($value);
    $this->modal($deleteStudent, $key)->modal_hidden_field('user_id', $value['user_id'])->modal_end();
}} else {?>

                        <tr class="odd">
                            <td colspan="6" class="">No data available in table</td>
                        </tr>

                        <?php }?>
                    </tbody>
                </table>
                <div class="row dataTables_wrapper">
                    <div class="col-sm-12 col-md-6"><?=$this->pagination->display_stats()?></div>
                    <div class="col-sm-12 col-md-6 dataTables_paginate"><?=$this->pagination->display_paging()?></div>
                </div>
            </div>
        </div>
        <!-- END card -->
    </div>
    <!-- END CONTAINER FLUID -->
</div>
<!-- END PAGE CONTENT -->