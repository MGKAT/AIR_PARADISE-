<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Booking extends Model
{
    protected $fillable = [
        'flight_history_id',
        'full_name',
        'email',
        'card_number',
        'expiry_date',
        'cvv',
        'status',
    ];

    public function flight()
    {
        return $this->belongsTo(FlightHistory::class, 'flight_history_id');
    }
}
