<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema ODS</title>
    <link rel="stylesheet" href="/sistema_ods_2/assets/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
    .img-preview {
            width: 40px;
            height: 40px;
            margin-right: 5px;
            border: 1px solid #ccc;
        }

    .img-preview_2 {
            width: 100px;
            height: 100px;
            margin-right: 5px;
            border: 1px solid #ccc;

    }
    
    .ods-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .ods-card img {
            width: 50px;
            height: 50px;
            margin-right: 15px;
            border-radius: 5px;
        }
        .ods-card label {
            margin-bottom: 0;
            flex-grow: 1;
        }
        .group-header {
            background-color: #f8f9fa;
            padding: 10px 15px;
            border-radius: 8px;
            margin-bottom: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .group-header:hover {
            background-color: #e9ecef;
        }
        .group-header img {
            width: 70px;
            height: 70px;
            margin-right: 15px;
        }
        .group-items {
            padding-left: 30px;
            display: none;
        }
        .group-title {
            display: flex;
            align-items: center;
            flex-grow: 1;
        }
        .group-arrow {
            transition: transform 0.3s;
        }
        .group-arrow.rotated {
            transform: rotate(90deg);
        }
        .tipo-imagem-label {
            font-size: 0.9rem;
            margin-right: 10px;
        }
        .btn-floating {
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 999;
            border-radius: 50px;
            padding: 12px 24px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            font-size: 1.1rem;
        }
    </style>    
</head>
<body>
<?php include 'navbar.php'; ?>