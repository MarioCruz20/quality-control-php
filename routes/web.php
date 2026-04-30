<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Web\ProductionLineController;
use App\Http\Controllers\Web\ProductController;
use App\Http\Controllers\Web\QualityParametersController;
use App\Http\Controllers\Web\LotController;
use App\Http\Controllers\Web\PlanProduccionController;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', function (){
    return view('home');
});

//RUTAS DE PRODUCTION LINE
Route::get('/production_line', [ProductionLineController::class, 'index'])->name('production_line.index');
Route::get('/production_line/create', [ProductionLineController::class, 'create'])->name('production_line.create');
Route::post('/production_line/store', [ProductionLineController::class, 'store'])->name('production_line.store');
Route::get('/production_line/edit/{id}', [ProductionLineController::class, 'edit'])->name('production_line.edit');
Route::put('/production_line/update/{id}', [ProductionLineController::class, 'update'])->name('production_line.update');
Route::delete('/production_line/destroy/{id}', [ProductionLineController::class, 'destroy'])->name('production_line.destroy');

//RUTAS DE PRODUCT
Route::get('/product', [ProductController::class, 'index'])->name('product.index');
Route::get('/product/create', [ProductController::class, 'create'])->name('product.create');
Route::post('/product/store', [ProductController::class, 'store'])->name('product.store');
Route::get('/product/edit/{id}', [ProductController::class, 'edit'])->name('product.edit');
Route::put('/product/update/{id}', [ProductController::class, 'update'])->name('product.update');
Route::delete('/product/destroy/{id}', [ProductController::class, 'destroy'])->name('product.destroy');

//RUTAS DE QUALITY_PARAMETERS
Route::get('/quality_parameters', [QualityParametersController::class, 'index'])->name('quality_parameters.index');
Route::get('/quality_parameters/create', [QualityParametersController::class, 'create'])->name('quality_parameters.create');
Route::post('/quality_parameters/store', [QualityParametersController::class, 'store'])->name('quality_parameters.store');
Route::get('/quality_parameters/edit/{id}', [QualityParametersController::class, 'edit'])->name('quality_parameters.edit');
Route::put('/quality_parameters/update/{id}', [QualityParametersController::class, 'update'])->name('quality_parameters.update');
Route::delete('/quality_parameters/destroy/{id}', [QualityParametersController::class, 'destroy'])->name('quality_parameters.destroy');

//RUTAS DE LOT
Route::get('/lot', [LotController::class, 'index'])->name('lot.index');
Route::get('/lot/create', [LotController::class, 'create'])->name('lot.create');
Route::post('/lot/store', [LotController::class, 'store'])->name('lot.store');
Route::get('/lot/edit/{id}', [LotController::class, 'edit'])->name('lot.edit');
Route::put('/lot/update/{id}', [LotController::class, 'update'])->name('lot.update');
Route::delete('/lot/destroy/{id}', [LotController::class, 'destroy'])->name('lot.destroy');

//RUTAS DE PLANPRODUCCION
Route::get('/plan_produccion', [PlanProduccionController::class, 'index'])->name('plan_produccion.index');
Route::post('/plan_produccion/obtener', [PlanProduccionController::class, 'obtenerPlanPorLineaYFecha'])->name('plan_produccion.obtener');
Route::post('/plan_produccion/store', [PlanProduccionController::class, 'store'])->name('plan_produccion.store');