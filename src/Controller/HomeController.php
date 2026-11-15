<?php

declare(strict_types=1);

namespace App\Controller;

use App\Core\Controller;
use App\Core\Database;
use App\Model\Trajet;

/**
 * Gère la page d'accueil.
 */
class HomeController extends Controller
{
    /**
     * Affiche la liste des trajets disponibles.
     */
    public function index(): void
    {
        $trajetModel = new Trajet(Database::getConnection());

        $this->render('home/index', [
            'title'   => 'Trajets proposés',
            'trajets' => $trajetModel->findAvailable(),
        ]);
    }
}