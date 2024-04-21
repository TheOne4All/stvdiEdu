<?php

require FYNX_PUBLIC['media'].'froala/php/FroalaEditor.php';

$options = array(
  'resize' => array(
    'columns' => 300,
    'rows' => 300,
    'bestfit' => true
  )
);

try {
  $response = FroalaEditor_Image::upload('/images/', $options);
  echo stripslashes(json_encode($response));
} catch (Exception $e) {
  echo $e->getMessage();
  http_response_code(404);
}