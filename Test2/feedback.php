<?php

    //php заменяет символы в POST/GET
    function fixReplacedText($text) {
        $text=str_replace("#_#",'.',$text);
        $text=str_replace("#-#","+",$text);
        $text=str_replace("#20#"," ",$text);
        return $text;
    }

    function checkEmail($email){
        return (strpos($email,"@gmail.com")===false);
    };

    $result = true;

    $post_decoded = json_decode(array_shift(array_flip($_POST)));
    
    if (isset($post_decoded->email)){
        $result = checkEmail(fixReplacedText($post_decoded->email));
    };

    header('Content-Type: application/json');
    if ($result) {
        echo json_encode(["status"=>"Ok",
        "email"=>fixReplacedText($post_decoded->email)
    ]);
    }    
    else 
        echo json_encode(["status"=>"Error","email"=>fixReplacedText($post_decoded->email)
    ]);
    
?>