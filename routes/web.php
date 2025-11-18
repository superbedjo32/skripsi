<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FasilitasController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\PenginapanController;
use App\Http\Controllers\LoginController;
use App\Http\Middleware\CheckLogin;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\IDFController;
use App\Http\Controllers\TfController;
use App\Http\Controllers\TFIDFController;
use App\Http\Controllers\RekomendasiController;
use App\Http\Controllers\UserPenginapanController;

Route::get('/register', [AuthController::class, 'showRegisterForm'])->name('register');
Route::post('/register', [AuthController::class, 'register'])->name('register.store');

Route::get('/', [LoginController::class, 'index'])->name('login.index');
Route::post('/', [LoginController::class, 'login'])->name('login');
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

Route::middleware([CheckLogin::class])->group(function () {
    Route::get('/dashboard', function () {
        return view('pages.dashboard');
    });

    Route::middleware('auth')->group(function () {
        Route::get('/user/home', function () {
            return view('user.home');
        })->name('user.home');
        Route::get('/user/rekomendasi', [RekomendasiController::class, 'index'])->name('user.rekomendasi');
        // routes/web.php
        Route::get('/user/penginapan', [UserPenginapanController::class, 'index'] )->name('user.penginapan');
        Route::post('/user/penginapan/rekomendasi', [UserPenginapanController::class, 'rekomendasi'] )->name('user.penginapan.rekomendasi');
    });

    Route::prefix('fasilitas')->group(function () {
        Route::get('/', [FasilitasController::class, 'index'])->name('fasilitas.index');
        Route::get('/edit/{id}', [FasilitasController::class, 'edit'])->name('fasilitas.edit');
        Route::put('/{id}', [FasilitasController::class, 'update'])->name('fasilitas.update');
        Route::get('/create', [FasilitasController::class, 'create'])->name('fasilitas.create');
        Route::post('/store', [FasilitasController::class, 'store'])->name('fasilitas.store');
        Route::delete('/{id}', [FasilitasController::class, 'delete'])->name('fasilitas.delete');
    });

    Route::prefix('penginapan')->group(function () {
        Route::get('/', [PenginapanController::class, 'index'])->name('penginapan.index');
        Route::get('/create', [PenginapanController::class, 'create'])->name('penginapan.create');
        Route::post('/store', [PenginapanController::class, 'store'])->name('penginapan.store');
        Route::get('/edit/{id}', [PenginapanController::class, 'edit'])->name('penginapan.edit');
        Route::put('/{id}', [PenginapanController::class, 'update'])->name('penginapan.update');
        Route::delete('/{id}', [PenginapanController::class, 'delete'])->name('penginapan.delete');
    });

    Route::prefix('kategori')->group(function () {
        Route::get('/', [KategoriController::class, 'index'])->name('kategori.index');
        Route::get('/edit/{id}', [KategoriController::class, 'edit'])->name('kategori.edit');
        Route::put('/{id}', [KategoriController::class, 'update'])->name('kategori.update');
        Route::get('/create', [KategoriController::class, 'create'])->name('kategori.create');
        Route::post('/store', [KategoriController::class, 'store'])->name('kategori.store');
        Route::delete('/{id}', [KategoriController::class, 'delete'])->name('kategori.delete');
    });

    Route::prefix('tf')->group(function () {
        Route::get('/', [TfController::class, 'index'])->name('tf.index');
        Route::post('/store', [TfController::class, 'store'])->name('tf.store');
        Route::delete('/{id}', [TfController::class, 'destroy'])->name('tf.delete');
    });

    Route::prefix('idf')->group(function () {
        Route::get('/', [IDFController::class, 'index'])->name('idf.index');
        Route::post('/store', [IDFController::class, 'store'])->name('idf.store');
        Route::delete('/{id}', [IDFController::class, 'delete'])->name('idf.delete');
    });

    Route::prefix('tfidf')->group(function () {
        Route::get('/', [TFIDFController::class, 'index'])->name('tfidf.index');
        Route::post('/store', [TFIDFController::class, 'store'])->name('tfidf.store');
        Route::delete('/{id}', [TFIDFController::class, 'delete'])->name('tfidf.delete');
    });
});
