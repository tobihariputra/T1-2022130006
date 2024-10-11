<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selamat Datang di SPP</title>
    @vite(['resources/sass/app.scss', 'resources/css/app.css'])
</head>

<body class="img-fluid"
    style="background-image: url({{ asset('storage/images/bg-dashboard.png') }}); background-size: cover; background-repeat: no-repeat; background-position: center">
    <div class="container d-flex flex-column justify-content-center align-items-center vh-100">
        <div class="text-center bg-white p-5 rounded shadow opacity-90">
            <h1 class="display-4">Sistem Pengelolaan Produk</h1>
            <p class="lead">Selamat Datang di Sistem Pengelolaan Produk.</p>
            <p class="h6">Nama : Tobi Hariputra</p>
            <p class="h6">NPM : 2022130006</p>
            <a href="{{ route('dashboard') }}" class="btn btn-primary btn-lg mt-3">Dashboard</a>
            <a href="{{ route('products.index') }}" class="btn btn-info btn-lg mt-3">Products</a>
            <a href="{{ route('products.create') }}" class="btn btn-success btn-lg mt-3">Add New Product</a>
        </div>
    </div>

    @vite(['resources/js/app.js'])
</body>

</html>
