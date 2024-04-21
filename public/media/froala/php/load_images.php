<?php

require FYNX_PUBLIC['media'].'froala/lib/FroalaEditor.php';

$response = FroalaEditor_Image::getList('/images/');

echo stripslashes(json_encode($response));
?>