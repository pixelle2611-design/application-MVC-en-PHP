<?php

declare(strict_types=1);

namespace App\Core;

/**
 * Classe de base des contrôleurs : gère l'affichage des vues.
 */
abstract class Controller
{
    /**
     * Affiche une vue dans le gabarit commun.
     *
     * @param string               $view Chemin de la vue, sans extension (ex : "home/index")
     * @param array<string, mixed> $data Variables transmises à la vue
     */
    protected function render(string $view, array $data = []): void
    {
        extract($data);

        // La vue est capturée puis insérée dans le gabarit
        ob_start();
        require __DIR__ . '/../View/' . $view . '.php';
        $content = (string) ob_get_clean();

        require __DIR__ . '/../View/layout.php';
    }
}