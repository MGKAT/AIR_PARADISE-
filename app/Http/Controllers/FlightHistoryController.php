<?php

namespace App\Http\Controllers;
use App\Models\FlightHistory;
use App\Models\Booking;
use Illuminate\Http\Request;

class FlightHistoryController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->validate([
            'departure_city' => 'required|string',
            'arrival_city' => 'required|string',
            'flight_date' => 'required|date',
            'departure_time' => 'required|string',
            'arrival_time' => 'required|string',
            'price' => 'required|numeric',
        ]);

        $flight = FlightHistory::create($data);

        return response()->json(['success' => true,
        'message' => 'Vol enregistré avec succès',
        'flight_id' => $flight->id 
    ]);
    }

    public function booking(Request $request)
    {
        $validated = $request->validate([
            'test_id' => 'required|exists:flight_histories,id',
            'full_name' => 'required|string|max:255',
            'email' => 'required|email',
            'card_number' => 'required|string',
            'expiry_date' => 'required|string',
            'cvv' => 'required|string',
        ]);

        // Créer la réservation
        $booking = Booking::create([
            'flight_history_id' => $validated['test_id'],
            'full_name' => $validated['full_name'],
            'email' => $validated['email'],
            'card_number' => encrypt($validated['card_number']),
            'expiry_date' => $validated['expiry_date'],
            'cvv' => encrypt($validated['cvv']),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Réservation enregistrée avec succès',
            'booking_id' => $booking->id,
        ]);
    }


}
