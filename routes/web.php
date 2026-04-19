<?php

use App\Http\Controllers\Web\ProductController;
use App\Http\Controllers\Web\ProductionLineController;
use App\Http\Controllers\Web\QualityParametersController;

use Illuminate\Support\Facades\Route;

//Antes
//Route::get('/home', function () {
//    return view('home');
//});


Route::get('/', function () {
    return view('home');
});

//Cambio a primera vista 
Route::get('/home', function () {
    return view('welcome');
});

//Production_line
Route::get('/production_line', [ProductionLineController::class, 'index'])->name('production_line.index');
Route::get('/production_line/create', [ProductionLineController::class, 'create'])->name('production_line.create');
Route::post('/production_line/store', [ProductionLineController::class, 'store'])->name('production_line.store');
Route::get('/production_line/edit/{id}', [ProductionLineController::class, 'edit'])->name('production_line.edit');
Route::put('/production_line/update/{id}', [ProductionLineController::class, 'update'])->name('production_line.update');
Route::delete('/production_line/destroy/{id}', [ProductionLineController::class, 'destroy'])->name('production_line.destroy');

//Product
Route::get('/products', [ProductController::class, 'index'])->name('product.index');
Route::get('/product/create', [ProductController::class, 'create'])->name('product.create');
Route::post('/product/store', [ProductController::class, 'store'])->name('product.store');
Route::get('/product/edit/{id}', [ProductController::class, 'edit'])->name('product.edit');
Route::put('/product/update/{id}', [ProductController::class, 'update'])->name('product.update');
Route::delete('/product/destroy/{id}', [ProductController::class, 'destroy'])->name('product.destroy');

// Quality Parameters
Route::get('/quality_parameters', [QualityParametersController::class, 'index'])->name('quality_parameters.index');
Route::get('/qualityparameters/create', [QualityParametersController::class, 'create'])->name('qualityparameters.create');
Route::post('/qualityparameters/store', [QualityParametersController::class, 'store'])->name('qualityparameters.store');
Route::get('/qualityparameters/edit/{id}', [QualityParametersController::class, 'edit'])->name('qualityparameters.edit');
Route::put('/qualityparameters/update/{id}', [QualityParametersController::class, 'update'])->name('qualityparameters.update');
Route::delete('/qualityparameters/destroy/{id}', [QualityParametersController::class, 'destroy'])->name('qualityparameters.destroy');