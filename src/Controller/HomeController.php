<?php

declare(strict_types=1);

namespace App\Controller;

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
        echo 'Accueil : le routeur fonctionne.';
    }
}