<?php

require FYNX_PUBLIC['media'].'froala/php/FroalaEditor.php';

$options = array(
  'validation' => null
);

try {
  $response = FroalaEditor_File::upload('/files/', $options);
  echo stripslashes(json_encode($response));
} catch (Exception $e) {
  echo $e->getMessage();
  http_response_code(404);
}