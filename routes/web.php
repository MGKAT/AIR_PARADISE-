<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FlightHistoryController;

Route::get('/', function () {
    return view('welcome');
});

Route::post('/flight-history', [FlightHistoryController::class, 'store']);
Route::post('/process-booking', [FlightHistoryController::class, 'booking']);
Route::get('/check-db', function() {
    return [
        'database' => DB::connection()->getDatabaseName(),
        'config' => config('database.connections.'.config('database.default'))
    ];
});