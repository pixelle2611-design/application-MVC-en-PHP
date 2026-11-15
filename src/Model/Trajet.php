<?php

declare(strict_types=1);

namespace App\Model;

use PDO;

/**
 * Accès aux données des trajets.
 */
class Trajet
{
    /**
     * @param PDO $pdo Connexion à la base de données
     */
    public function __construct(private PDO $pdo)
    {
    }

    /**
     * Retourne les trajets à venir qui ont encore des places libres,
     * triés par date de départ croissante.
     *
     * @return array<int, array<string, mixed>>
     */
    public function findAvailable(): array
    {
        $sql = 'SELECT t.id_trajet,
                       t.date_heure_depart,
                       t.date_heure_arrivee,
                       t.places_total,
                       t.places_disponibles,
                       t.id_auteur,
                       ad.nom AS agence_depart,
                       aa.nom AS agence_arrivee,
                       u.nom AS auteur_nom,
                       u.prenom AS auteur_prenom,
                       u.telephone AS auteur_telephone,
                       u.email AS auteur_email
                FROM trajet t
                JOIN agence ad ON ad.id_agence = t.id_agence_depart
                JOIN agence aa ON aa.id_agence = t.id_agence_arrivee
                JOIN utilisateur u ON u.id_utilisateur = t.id_auteur
                WHERE t.date_heure_depart > NOW()
                  AND t.places_disponibles > 0
                ORDER BY t.date_heure_depart ASC';

        $statement = $this->pdo->query($sql);

        if ($statement === false) {
            return [];
        }

        return $statement->fetchAll();
    }
}