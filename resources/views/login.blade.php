<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>B-Area Login</title>

    <!-- Favicon huruf B (biru + putih) -->
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><rect width=%22100%25%22 height=%22100%25%22 fill=%22%234e73df%22 rx=%2220%22/><text y=%22.9em%22 font-size=%2280%22 fill=%22white%22 font-weight=%22bold%22 text-anchor=%22middle%22 x=%2250%25%22>B</text></svg>">

    <!-- Font Awesome & Google Font -->
    <link href="{{ asset('template/vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- SB Admin 2 CSS -->
    <link href="{{ asset('template/css/sb-admin-2.min.css') }}" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-10">

                <!-- Card Kotak Biasa (Rounded + Shadow) -->
                <div class="card o-hidden border-0 shadow-lg my-5 bg-white rounded-lg">
                    <div class="card-body p-5">

                        <!-- Judul -->
                        <div class="text-center mb-5">
                            <h1 class="h3 font-weight-bold text-primary">B-Area Login</h1>
                            <p class="text-gray-800">Halo Travelers! Silakan login</p>
                        </div>

                        <!-- Alert Sukses -->
                        @if (session('success'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle mr-2"></i>
                                {{ session('success') }}
                                <button type="button" class="close" data-dismiss="alert">×</button>
                            </div>
                        @endif

                        <!-- Alert Error -->
                        @if ($errors->any())
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle mr-2"></i>
                                {{ $errors->first() }}
                                <button type="button" class="close" data-dismiss="alert">×</button>
                            </div>
                        @endif

                        <!-- Form Login -->
                        <form method="POST" action="{{ route('login') }}" class="user">
                            @csrf

                            <div class="form-group">
                                <input type="email" name="email" class="form-control form-control-user"
                                    placeholder="Email Address" required autofocus>
                            </div>

                            <div class="form-group">
                                <input type="password" name="password" class="form-control form-control-user"
                                    placeholder="Password" required>
                            </div>

                            <button type="submit" class="btn btn-primary btn-user btn-block font-weight-bold">
                                <i class="fas fa-sign-in-alt mr-2"></i> Login
                            </button>
                        </form>

                        <hr class="bg-primary">

                        <!-- Tombol Register -->
                        <div class="text-center">
                            <a href="{{ route('register') }}" class="btn btn-success btn-user btn-block font-weight-bold">
                                <i class="fas fa-user-plus mr-2"></i> Buat Akun Baru
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="{{ asset('template/vendor/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('template/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('template/vendor/jquery-easing/jquery.easing.min.js') }}"></script>
    <script src="{{ asset('template/js/sb-admin-2.min.js') }}"></script>
</body>
</html>
