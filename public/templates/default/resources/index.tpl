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
    <title><?=FYNX_APP['name']?></title>
    <!--
    Stylesheets
    =============================================

    -->
    <!-- Default stylesheets-->
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/lib/bootstrap/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="<?=FYNX_PUBLIC['template_url']?>default/assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="<?=FYNX_PUBLIC['template_url']?>default/assets/css/colors/default.css"
        rel="stylesheet">
</head>

<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main><img id="image-background" src="<?=FYNX_PUBLIC['template_url']?>default/assets/images/3.jpg">
        <section class="main">
            <div class="content">
                <div class="container">
                    <div class="content2">
                        <h1>FYNX</h1>
                    </div>
                    <div class="counter" id="countdown">
                        <h3>FRAMEWORK</h3>
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <p>FYNX Framework is developed by Jencube using simple computing architecture they
                                    coined (S.L.O - Storage Logic Output).</p>
                            </div>
                        </div>
                    </div>
                    <div class="subscribe">
                        <div class="row">
                            <div
                                class="col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 input-group subscribe-box">
                                <?php if (isset($_SESSION['authenticated'])) {?>
                                <a href="<?=FYNX_PUBLIC['url'] . 'dashboard'?>"
                                    class="btn bg-primary m-2 p-1">Dashboard</a>
                                <?php } else {?>
                                <a href="<?=FYNX_PUBLIC['url'] . 'auth/signin'?>" class="btn bg-primary"
                                    style="margin-right:20px;">Login</a>
                                <a href="<?=FYNX_PUBLIC['url'] . 'auth/signup'?>" class="btn bg-primary">Register</a>
                                <?php }?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>

</html>