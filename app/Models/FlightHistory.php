<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class FlightHistory extends Model
{

        protected $fillable = [
            'departure_city',
            'arrival_city',
            'flight_date',
            'departure_time',
            'arrival_time',
            'price',
        ];
        
}


