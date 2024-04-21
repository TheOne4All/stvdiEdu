<!DOCTYPE html>
<html lang="en">

<!-- Footer -->
<?php require_once 'header.tpl';?>
<!-- / Footer -->

<body class="fixed-header ">

    <!-- Alert Display Notification -->
    <?php $this->alert($_GET);?>

    <!-- Content -->
    <?php require_once $this->master_content;?>
    <!-- / Content -->

    <!-- Footer -->
    <?php require_once 'footer.tpl';?>
    <!-- / Footer -->

</body>

</html>