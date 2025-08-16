<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="{{ asset('js/app.js') }}" defer></script>
    <meta charset="utf-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chatbot de Réservation | AIR PARADISE</title>

    <!-- Polices optimisées -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
       
    </style>
</head>

<body>
    <!-- Video Background -->
    <div class="video-background">
        <video autoplay muted loop playsinline>
            <source src="{{ asset('media/1.mp4') }}" type="video/mp4">
            <!-- Fallback image if video doesn't load -->
            <img src="1.jpg" alt="Background">
        </video>
        <div class="video-overlay"></div>
    </div>

    <!-- Header -->
    <header class="main-header">
        <div class="container header-flex">
            <img src="{{ asset('media/logo.png') }}" alt="AIR PARADISE" class="logo">
            <p>Air paradise</p>
        </div>
    </header>

    <!-- Contenu principal -->
    <main class="main-container">
        <section class="hero">
            <h1>Chatbot de Réservation AIR PARADISE</h1>
            <p>Je vous aide à trouver et réserver le vol parfait vers les États-Unis</p>
        </section>

        <div class="chatbot-container">
            <div class="chatbot-header">
                <i class="fas fa-robot"></i>
                <h2>Assistant AIR PARADISE</h2>
            </div>
            
            <div class="chatbot-messages" id="chat-messages">
                <div class="message bot-message">
                    <div class="message-content">
                        Bonjour ! Je suis l'assistant AIR PARADISE. Je peux vous aider à trouver et réserver des vols vers les États-Unis. D'où partez-vous ?
                    </div>
                </div>
            </div>
            
            <div class="chatbot-input">
                <input type="text" id="user-input" placeholder="Tapez votre message..." autofocus>
                <button id="send-button"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>
        
        <div id="flight-search-form" class="form-container hidden">
            <h3>Recherche de vols</h3>
            <form id="search-form">
                <div class="form-group">
                    <label for="departure-city">Ville de départ</label>
                    <input type="text" class="form-control" id="departure-city" required disabled>
                </div>
                <div class="form-group">
                    <label for="arrival-city">Ville d'arrivée</label>
                    <input type="text" class="form-control" id="arrival-city" required disabled>
                </div>
                <div class="form-group">
                    <label for="departure-date">Date de départ</label>
                    <input type="date" class="form-control" id="departure-date" required>
                </div>
                <button type="submit" class="btn"><i class="fas fa-search"></i> Rechercher des vols</button>
            </form>
        </div>
        
        <div id="flight-results" class="form-container hidden">
            <h3>Résultats de recherche</h3>
            <div class="flight-options" id="flight-options">
            </div>
        </div>
        
        <div id="booking-form" class="form-container hidden">
            <h3>Réservation</h3>
            <form id="payment-form">
                <input type="hidden" name="test_id" id="test_id" >
                <div class="form-group">
                    <label>Nom complet</label>
                    <input type="text"  class="form-control" id="full_name" required>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" class="form-control" id="email" required>
                </div>
                <div class="form-group">
                    <label>Numéro de carte bancaire</label>
                    <input type="text" class="form-control" id="card_number" placeholder="1234 5678 9012 3456" required>
                </div>
                <div class="row" style="display: flex; gap: 1rem;">
                    <div class="form-group" style="flex: 1;">
                        <label>Date d'expiration</label>
                        <input type="text" class="form-control" id="expiry_date" placeholder="MM/AA" required>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <label>CVV</label>
                        <input type="text" class="form-control" id="cvv" placeholder="123" required>
                    </div>
                </div>
                <button type="submit" class="btn"><i class="fas fa-check"></i> Confirmer la réservation</button>
            </form>
        </div>
    </main>

    <!-- Scripts -->
    <script>
       
    </script>
</body>
</html>