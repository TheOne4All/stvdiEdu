<?php

require FYNX_PUBLIC['media'].'froala/php/FroalaEditor.php';

try {
  $src = $_POST['src'];
  $srcArray = explode("/",$src);
  if($srcArray[1]=='files'){
  $response = FroalaEditor_File::delete($_POST['src']);
  echo stripslashes(json_encode('Success'));
  }
  else {
    echo stripslashes(json_encode('Failure'));
  }
} catch (Exception $e) {
  echo $e->getMessage();
  http_response_code(404);
}