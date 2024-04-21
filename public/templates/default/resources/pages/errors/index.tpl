<!-- [begin-extend-template]resources/nepayatri/pages/layouts/master[end] -->

<!-- error section starts -->
<section class="error error-1">
    <div class="container">
        <div class="error-content text-center">
            <h3><?=$subject?></h3>
            <h1>
                <?php $code = str_split($code);
for ($i = 0; $i < count($code); $i++) {
    echo "<span>" . $code[$i] . "</span>";
}
?>
            </h1>
            <h2 class="mar-0"><?=$message?></h2>
            <div class="error-btn">
                <button onclick="history.back()" class="biz-btn biz-btn1 mar-right-10">GO BACK</button>
                <a href="<?=FYNX_PUBLIC['url']?>" class="biz-btn-black">GO TO HOME PAGE</a>
            </div>
        </div>
    </div>
</section>
<!-- error section Ends -->