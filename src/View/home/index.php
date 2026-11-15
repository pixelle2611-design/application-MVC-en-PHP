<?php
/**
 * Page d'accueil : liste des trajets disponibles.
 *
 * @var array<int, array<string, mixed>> $trajets
 */

$formatDate  = fn (string $value): string => (new DateTimeImmutable($value))->format('d/m/Y');
$formatHeure = fn (string $value): string => (new DateTimeImmutable($value))->format('H:i');
$escape      = fn (mixed $value): string => htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
?>
<h2 class="mb-4">Pour obtenir plus d'informations sur un trajet, veuillez vous connecter</h2>

<div class="table-responsive">
    <table class="table table-striped text-center align-middle">
        <thead class="table-dark">
            <tr>
                <th>Départ</th>
                <th>Date</th>
                <th>Heure</th>
                <th>Destination</th>
                <th>Date</th>
                <th>Heure</th>
                <th>Places</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($trajets as $trajet) : ?>
                <tr>
                    <td><?= $escape($trajet['agence_depart']) ?></td>
                    <td><?= $formatDate($trajet['date_heure_depart']) ?></td>
                    <td><?= $formatHeure($trajet['date_heure_depart']) ?></td>
                    <td><?= $escape($trajet['agence_arrivee']) ?></td>
                    <td><?= $formatDate($trajet['date_heure_arrivee']) ?></td>
                    <td><?= $formatHeure($trajet['date_heure_arrivee']) ?></td>
                    <td><?= $escape($trajet['places_disponibles']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>