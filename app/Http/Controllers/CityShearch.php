<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CityShearch extends Controller
{


public function search(){
    $response = Http::post('http://127.0.0.1:5000/search', [
        'query' => 'New Yor',
        // 'top_k' => 5
    ]);
    
    $results = $response->json();
}
}
