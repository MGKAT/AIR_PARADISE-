
document.addEventListener('DOMContentLoaded', function() {
    // Variables d'état
    const bookingInfo = {
        departure: '',
        arrival: '',
        price: '',
        date: '',
        flight: null
    };
    
    // Elements DOM
    const chatMessages = document.getElementById('chat-messages');
    const userInput = document.getElementById('user-input');
    const sendButton = document.getElementById('send-button');
    const searchForm = document.getElementById('search-form');
    const paymentForm = document.getElementById('payment-form');
    
    // Gestion de l'envoi des messages
    function handleSendMessage() {
        const message = userInput.value.trim();
        if (message) {
            addUserMessage(message);
            userInput.value = '';
            userInput.disabled = true; 
            sendButton.disabled = true;
            
            processUserInput(message).finally(() => {
                userInput.disabled = false;
                sendButton.disabled = false;
                userInput.focus();
            });
        }
    }
    
    // Ecouteurs d'evenements
    sendButton.addEventListener('click', handleSendMessage);
    userInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') handleSendMessage();
    });
    
    searchForm.addEventListener('submit', function(e) {
        e.preventDefault();
        bookingInfo.departure = document.getElementById('departure-city').value;
        bookingInfo.arrival = document.getElementById('arrival-city').value;
        bookingInfo.date = document.getElementById('departure-date').value;
        
        simulateFlightSearch();
    });
    
    // Fonction de paiement qui permet de stocker les information dans la base de données
    paymentForm.addEventListener('submit', async function(e) {
        
        e.preventDefault();
        test_id = document.getElementById('test_id').value;
        full_name = document.getElementById('full_name').value;
        email = document.getElementById('email').value;
        card_number = document.getElementById('card_number').value;
        expiry_date = document.getElementById('expiry_date').value;
        cvv = document.getElementById('cvv').value;

        try {
            const response = await fetch('/process-booking', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json'
                },
                body: JSON.stringify({
                    test_id: test_id,
                    full_name: full_name,
                    email: email,
                    card_number: card_number,
                    expiry_date: expiry_date,
                    cvv: cvv
                })
            });
            
            const data = await response.json();
            
            if (!response.ok) {
                throw new Error(data.message || 'Erreur lors du traitement');
            }
            
            // Afficher un message de succès
            addBotMessage("Votre réservation #" + data.booking_id + " a été confirmée ! Un email de confirmation vous a été envoyé.");
            
            // Réinitialiser le formulaire
            document.getElementById('booking-form').classList.add('hidden');
            
        } catch (error) {
            console.error('Erreur:', error);
            alert('Erreur: ' + error.message);
        } finally {
            submitButton.disabled = false;
            submitButton.innerHTML = originalButtonText;
        }
        
        
        setTimeout(() => {
            addBotMessage("Puis-je vous aider pour autre chose ?");
        }, 2000);
    });
    
    // Fonctions utilitaires pour ajouter les differents message du tchatbox
    function addBotMessage(text, isTyping = false) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message bot-message';
        
        if (isTyping) {
            messageDiv.innerHTML = `
                <div class="message-content typing-indicator">
                    <div class="typing-dot"></div>
                    <div class="typing-dot"></div>
                    <div class="typing-dot"></div>
                </div>
            `;
        } else {
            messageDiv.innerHTML = `<div class="message-content">${text}</div>`;
        }
        
        chatMessages.appendChild(messageDiv);
        scrollToBottom();
        
        if (isTyping) {
            return new Promise(resolve => {
                setTimeout(() => {
                    messageDiv.querySelector('.typing-indicator').outerHTML = `<div class="message-content">${text}</div>`;
                    resolve();
                }, 1500);
            });
        }
    }
    
    function addUserMessage(text) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'message user-message';
        messageDiv.innerHTML = `<div class="message-content">${text}</div>`;
        chatMessages.appendChild(messageDiv);
        scrollToBottom();
    }
    
    function scrollToBottom() {
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }
    
    async function processUserInput(input) {
        if (!bookingInfo.departure) {
            const correctedCity = await fetchCitySuggestion(input);
            //alert(correctedCity)

            bookingInfo.departure = correctedCity;
            await addBotMessage(`Très bien, vous partez de ${correctedCity}. Quelle est votre destination ?`, true);
        } else if (!bookingInfo.arrival) {
            const correctedCity = await fetchCitySuggestion(input);
            bookingInfo.arrival = correctedCity;

            bookingInfo.price = await fetchPriceSuggestion(bookingInfo.departure, bookingInfo.arrival);
            // const priceSuggestion = await fetchPriceSuggestion(bookingInfo.departure, bookingInfo.arrival).then(console.log);
            
            await addBotMessage(`Destination : ${correctedCity}. Quelle date envisagez-vous pour votre voyage ?`, true);
            
            // Afficher le formulaire de recherche
            document.getElementById('flight-search-form').classList.remove('hidden');
            document.getElementById('departure-city').value = bookingInfo.departure;
            document.getElementById('arrival-city').value = bookingInfo.arrival;
            
            // Scroll vers le formulaire
            document.getElementById('flight-search-form').scrollIntoView({ behavior: 'smooth' });
        } else {
            await addBotMessage("Utilisez le formulaire ci-dessous pour compléter votre recherche.", true);
        }
    }
    
    async function simulateFlightSearch() {
        
        document.getElementById('flight-search-form').classList.add('hidden');
        await addBotMessage(`Je recherche des vols de ${bookingInfo.departure} à ${bookingInfo.arrival} pour le ${bookingInfo.date}...`, true);
        
        // Simule un délai de recherche
        setTimeout(() => {
            //On teste si nous trouvons un trajet similaire dans le dataset, ou s'il existe un trajet 
            if (bookingInfo.price == 'Aucune suggestion'){
                bookingInfo.departure = '';
                bookingInfo.arrival = '';
                bookingInfo.price = '';
                bookingInfo.date = '';
                bookingInfo.flight = null;
        
                // Cacher les sections
                document.getElementById('flight-search-form').classList.add('hidden');
                document.getElementById('flight-results').classList.add('hidden');
        
                // On reinitialise de chatbox
                addBotMessage(`Désolé, les villes entrer n'ont pas d'aeroport. <button class="btn" onclick="startNewSearch()">Nouvelle recherche</button>`);

                // Réactiver la saisie utilisateur pour recommencer
                userInput.disabled = false;
                sendButton.disabled = false;
                userInput.focus();
        
                return;
            }else{
            document.getElementById('flight-options').innerHTML = `
                <div class="flight-option" data-price="350">
                    <h4>${bookingInfo.departure} → ${bookingInfo.arrival}</h4>
                    <p><strong>Compagnie:</strong> AIR PARADISE</p>
                    <p><strong>Départ:</strong> ${bookingInfo.date} à 08:00</p>
                    <p><strong>Arrivée:</strong> ${bookingInfo.date} à 11:00</p>
                    <p class="price">$${bookingInfo.price}</p>
                </div>
               
            `;
            
            document.getElementById('flight-results').classList.remove('hidden');
            addBotMessage("Voici les vols disponibles. Veuillez en sélectionner un pour continuer.", true);
            
            // Scroll vers les résultats
            document.getElementById('flight-results').scrollIntoView({ behavior: 'smooth' });
            
            // Gestion de la sélection d'un vol
            document.querySelectorAll('.flight-option').forEach(option => {
                // À placer DANS le gestionnaire de clic (à l'intérieur de forEach)
            option.addEventListener('click', async function() {
            const price = this.getAttribute('data-price');
            const departureTime = this.querySelector('p:nth-child(3)').textContent.split('à ')[1];
            const arrivalTime = this.querySelector('p:nth-child(4)').textContent.split('à ')[1];
            const airline = this.querySelector('p:nth-child(2)').textContent.split(': ')[1];

            bookingInfo.flight = {
                departure: bookingInfo.departure,
                arrival: bookingInfo.arrival,
                date: bookingInfo.date,
                price: bookingInfo.price,
                details: this.querySelector('h4').textContent
            };

    try {
        // Permet de stocker chaque recherche dans notre BD pour avoir une idée des historique de recherche et enventuellement enrichir notre dataset dans le futur
        const response = await fetch('/flight-history', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json'
            },
            body: JSON.stringify({
                departure_city: bookingInfo.departure,
                arrival_city: bookingInfo.arrival,
                flight_date: bookingInfo.date,
                departure_time: departureTime,
                arrival_time: arrivalTime,
                price: bookingInfo.price
            })
        });

        const data = await response.json();

        if (!data.success) {
            console.error("Erreur lors de l'enregistrement de l'historique du vol.");
            // alert(JSON.stringify(data));
            // alert(data.flight_id)

        }else{
            document.getElementById('test_id').value = data.flight_id
            // console.log(data.flight_id)
        }

    } catch (error) {
        console.error("Erreur lors de l'envoi vers Laravel :", error);
    }

        
        document.getElementById('flight-results').classList.add('hidden');
        document.getElementById('booking-form').classList.remove('hidden');

        addBotMessage(`Vous avez sélectionné le vol ${bookingInfo.flight.details} pour $${bookingInfo.price}. Veuillez compléter vos informations de paiement.`, true);
        document.getElementById('booking-form').scrollIntoView({ behavior: 'smooth' });
    });

            
            }); }
        }, 1500);
    }
    
    // Focus automatique sur le champ de saisie
    userInput.focus();

    // fonction de reinitialisation 
    window.startNewSearch = function startNewSearch() {
        bookingInfo.departure = '';
        bookingInfo.arrival = '';
        bookingInfo.price = '';
        bookingInfo.date = '';
        bookingInfo.flight = null;
    
        document.getElementById('flight-results').classList.add('hidden');
        document.getElementById('flight-search-form').classList.add('hidden');
        document.getElementById('booking-form').classList.add('hidden');
    
        addBotMessage("Très bien, reprenons. D'où partez-vous ?", true);
    }
    
    // permet de recherche la ville dans notre dataset de maniere intelligente 
    async function fetchCitySuggestion(userInput) {
        try {
            const response = await fetch("http://127.0.0.1:5000/search", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ query: userInput, top_k: 1 })
            });
    
            if (!response.ok) throw new Error("API non disponible");
    
            const data = await response.json();
            
            // Vérifie si on a au moins un résultat et récupère le nom de la ville
            const suggestedCity = data[0]?.city || userInput;
            
            // console.log("Ville suggérée:", suggestedCity);
            return suggestedCity;
    
        } catch (error) {
            console.error("Erreur requête Flask:", error);
            return userInput; // Retourne l'input original en cas d'erreur
        }
    }


    // Fonction de prédiction des prix
    async function fetchPriceSuggestion(departure, arrival_city) {
        try {
            const response = await fetch("http://127.0.0.1:5000/searchPrice", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({ departure, arrival_city })
            });
    
            // if (!response.ok) throw new Error("API non disponible");
    
            const data = await response.json();

            const suggestedPrice = data?.price || "Aucune suggestion";
    
            console.log(suggestedPrice);
            return (suggestedPrice);
    
        } catch (error) {
            // console.error("Erreur requête Flask:", error);
            // return "Erreur de requête";
            console.error("Erreur requête Flask:", error);
        alert(`Erreur lors de la récupération du prix : ${error.message}`);
        return "Erreur de requête";
        }
    }
    

    
});
