<?php

namespace App\Services;

use Illuminate\Support\Facades\Storage;

class CityNameSearchService
{
    private $index;
    private $cityNames;

    public function __construct()
    {
        // Charger l'index FAISS
        $this->index = \Faiss\Faiss::readIndex(
            storage_path('faiss_python/models/city_name_index.faiss')
        );
        
        // Charger les noms de villes
        $this->cityNames = [];
        $csv = Storage::get('faiss_python/models/city_names.csv');
        $lines = explode("\n", $csv);
        
        foreach ($lines as $line) {
            if (!empty($line)) {
                [$index, $name] = str_getcsv($line);
                $this->cityNames[$index] = $name;
            }
        }
    }

    public function findSimilarCities(string $query, int $maxResults = 5): array
    {
        // Nettoyer la requête
        $cleanQuery = $this->cleanInput($query);
        
        // Générer l'embedding via Python
        $embedding = $this->generateNameEmbedding($cleanQuery);
        
        // Recherche FAISS
        $distances = $indices = [];
        $this->index->search(
            [$embedding], 
            $maxResults, 
            $distances, 
            $indices
        );
        
        // Formater les résultats
        $results = [];
        foreach ($indices[0] as $idx => $faissIndex) {
            $results[] = [
                'name' => $this->cityNames[$faissIndex],
                'score' => $distances[0][$idx]
            ];
        }
        
        return $results;
    }

    private function cleanInput(string $text): string
    {
        return trim(mb_strtolower($text));
    }

    private function generateNameEmbedding(string $name): array
    {
        $process = new \Symfony\Component\Process\Process([
            'python3',
            base_path('faiss_python/scripts/generate_name_embedding.py'),
            $name
        ]);
        
        $process->mustRun();
        return json_decode($process->getOutput(), true);
    }
}