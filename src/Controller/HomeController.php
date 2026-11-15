<?php

declare(strict_types=1);

namespace App\Controller;

use App\Core\Database;
use App\Model\Trajet;

/**
 * Gère la page d'accueil.
 */
class HomeController
{
    /**
     * Affiche la page d'accueil.
     */
    public function index(): void
    {
        $trajetModel = new Trajet(Database::getConnection());
        $trajets = $trajetModel->findAvailable();

        // Affichage provisoire, remplacé par une vue ensuite
        echo '<pre>';
        print_r($trajets);
        echo '</pre>';
    }
}