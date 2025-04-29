<?php
function autoloadPhpSpreadsheet($class) {
    $base_dirs = [
        __DIR__ . '/PhpSpreadsheet/src/PhpSpreadsheet/',
        __DIR__ . '/vendor/Psr/SimpleCache/',
        __DIR__ . '/vendor/Composer/Pcre/',
        __DIR__ . '/vendor/ZipStream/'
    ];

    foreach ($base_dirs as $base_dir) {
        $file = $base_dir . str_replace(['PhpOffice\\PhpSpreadsheet\\', 'Psr\\SimpleCache\\', 'Composer\\Pcre\\', 'ZipStream\\', '\\'], ['', '', '', '', '/'], $class) . '.php';
        
        if (file_exists($file)) {
            require $file;
            return;
        }
    }
}

spl_autoload_register('autoloadPhpSpreadsheet');
?>