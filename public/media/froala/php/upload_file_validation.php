<?php

require FYNX_PUBLIC['media'].'froala/php/FroalaEditor.php';

$options = array(
  'fieldname' => 'myFile',
  'validation' => function($filePath, $mimetype) {

    $size = filesize($filePath);

    if ($size > 10 * 1024 * 1024) {
      return false;
    }

    return true;
  }
);

try {
  $response = FroalaEditor_File::upload('/files/', $options);
  echo stripslashes(json_encode($response));
} catch (Exception $e) {
  echo $e->getMessage();
  http_response_code(404);
}