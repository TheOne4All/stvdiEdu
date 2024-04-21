<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--
    Document Title
    =============================================
    -->
    <title>DASHBORD | <?=FYNX_APP['name']?></title>
    <!--
    Stylesheets
    =============================================

    -->
    <!-- Default stylesheets-->
    <link href="<?=FYNX_PUBLIC['stylesheet_lib_url']?>bootstrap.css" rel="stylesheet" type="text/css">
</head>

<body>

    <div class="border-bottom d-flex pt-2 pb-2">
        <div class="col-lg-12 text-right"><a
                href="<?=FYNX_PUBLIC['url'] . 'auth/signout/' . $_SESSION['user_session']['org_id']?>"
                class="btn bg-primary text-white">Sign-Out</a></div>
    </div>
    <div class="d-flex justify-content-center align-items-center">
        <div class="border row p-4 mt-4" style="min-width:350px;max-width:750px;">
            <div class="col-lg-12">
                <h4>Dashboard Active Session!</h4>
            </div>
            <div class="mt-3 mb-3 col-lg-12">
                <?php if (isset($_SESSION['idle_log'])) {var_dump($_SESSION['idle_log']);}?>
            </div>
        </div>
    </div>
</body>

</html>