<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title', 'Product Management')</title>

    @vite(['resources/sass/app.scss', 'resources/css/app.css'])
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}">Product Management</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link {{ request()->is('dashboard') ? 'active font-weight-bold text-primary' : '' }}" href="{{ route('dashboard') }}">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->is('products') || request()->is('products/*') ? 'active font-weight-bold text-primary' : '' }}" href="{{ route('products.index') }}">Products</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="py-4">
        @yield('content')
    </div>

    @yield('body')

    @vite(['resources/js/app.js'])
</body>

</html>
