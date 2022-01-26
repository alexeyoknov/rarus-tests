<?php
    $input_name = 'file';
 
    // Разрешенные расширения файлов.
    $allow = array();
    
    // Запрещенные расширения файлов.
    $deny = array(
        'phtml', 'php', 'php3', 'php4', 'php5', 'php6', 'php7', 'phps', 'cgi', 'pl', 'asp', 
        'aspx', 'shtml', 'shtm', 'htaccess', 'htpasswd', 'ini', 'log', 'sh', 'js', 'html', 
        'htm', 'css', 'sql', 'spl', 'scgi', 'fcgi', 'exe'
    );
    
    // Директория куда будут загружаться файлы.
    $path = __DIR__ . '/uploads/';
    $mdstatus = true;
    if (!is_dir($path))
        $mdstatus = mkdir($path,0755);
    
    $error = $success = '';
    if (!isset($_FILES[$input_name]) || !$mdstatus ) {
        $error = "Файл не загружен. Проверьте права доступа к «" . $path . "»";
    } else {
        $file = $_FILES[$input_name];
    
        // Проверим на ошибки загрузки.
        if (!empty($file['error']) || empty($file['tmp_name'])) {
            $error = 'Не удалось загрузить файл.';
        } elseif ($file['tmp_name'] == 'none' || !is_uploaded_file($file['tmp_name'])) {
            $error = 'Не удалось загрузить файл.';
        } else {
            // Оставляем в имени файла только буквы, цифры и некоторые символы.
            $pattern = "[^a-zа-яё0-9,~!@#%^-_\$\?\(\)\{\}\[\]\.]";
            $name = mb_eregi_replace($pattern, '-', $file['name']);
            $name = mb_ereg_replace('[-]+', '-', $name);
            $parts = pathinfo($name);
    
            if (empty($name) || empty($parts['extension'])) {
                $error = 'Недопустимый тип файла';
            } elseif (!empty($allow) && !in_array(strtolower($parts['extension']), $allow)) {
                $error = 'Недопустимый тип файла';
            } elseif (!empty($deny) && in_array(strtolower($parts['extension']), $deny)) {
                $error = 'Недопустимый тип файла';
            } else {
                // Перемещаем файл в директорию.
                if (move_uploaded_file($file['tmp_name'], $path . $name)) {
                    // Далее можно сохранить название файла в БД и т.п.
                    $success = '<p style="color: green">Файл «' . $name . '» успешно загружен.</p>';
                } else {
                    $error = 'Не удалось загрузить файл.';
                }
            }
        }
    }
    
    // Вывод сообщения о результате загрузки.
    if (!empty($error)) {
        $error = '<p style="color: red">' . $error . '</p>';  
    }
    
    $data = array(
        'error'   => $error,
        'success' => $success,
        'message' => (( $error === '' ) ? $success : $error), 
    );
    header('Content-Type: application/json');
    echo json_encode($data);
?>