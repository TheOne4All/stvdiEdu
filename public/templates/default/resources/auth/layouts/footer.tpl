<!-- BEGIN VENDOR JS -->
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/pace/pace.min.js" type="text/javascript"></script>
<!--  A polyfill for browsers that don't support ligatures: remove liga.js if not needed-->
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/liga.js" type="text/javascript"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery/jquery-3.2.1.min.js" type="text/javascript">
</script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/modernizr.custom.js" type="text/javascript">
</script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript">
</script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/popper/umd/popper.min.js" type="text/javascript">
</script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/bootstrap/js/bootstrap.min.js"
    type="text/javascript"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery/jquery-easy.js" type="text/javascript">
</script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-unveil/jquery.unveil.min.js"
    type="text/javascript"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-ios-list/jquery.ioslist.min.js"
    type="text/javascript"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-actual/jquery.actual.min.js"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script type="text/javascript"
    src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/select2/js/select2.full.min.js"></script>
<script type="text/javascript" src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/classie/classie.js"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/jquery-validation/js/jquery.validate.min.js"
    type="text/javascript"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/daterangepicker/moment.min.js"
    type="text/javascript"></script>
<script src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/daterangepicker/daterangepicker.js"
    type="text/javascript"></script>
<script type="text/javascript" src="<?=FYNX_PUBLIC['template_url']?>default/assets/plugins/dropzone/dropzone.min.js">
</script>
<!-- END VENDOR JS -->
<script src="<?=FYNX_PUBLIC['template_url']?>default/pages/js/pages.min.js"></script>
<script>
$(function() {
    $('#form-register').validate()
})

// DATE RANGE PICKER SCRIPT------------------------------------------------------------------------------------
$(".singleDatePicker").daterangepicker({
    singleDatePicker: true,
    autoApply: true,
    locale: {
        format: "DD-MM-YYYY",
    },
});
$(".rangeDatePicker").daterangepicker({
    autoApply: true,
    locale: {
        format: "DD-MM-YYYY",
    },
});
</script>