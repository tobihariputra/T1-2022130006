<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    @vite(['resources/sass/app.scss', 'resources/css/app.css'])
</head>
<body>
    <div class="container d-flex flex-column justify-content-center align-items-center vh-100">
        <div class="text-center">
            <h1 class="display-4">Sistem Pengelolaan Produk</h1>
            <p class="lead">Selamat Datang di Sistem Pengelolaan Produk.</p>
            <p class="h6">Nama : Tobi Hariputra</p>
            <p class="h6">NPM : 2022130006</p>
            <a href="{{ route('dashboard') }}" class="btn btn-primary btn-lg mt-3">Dashboard</a>
        </div>
    </div>

    @vite(['resources/js/app.js'])
</body>
</html>
