<?php

declare(strict_types=1);

use App\Core\Database;

// Chargement automatique des classes
require_once __DIR__ . '/../vendor/autoload.php';

$pdo = Database::getConnection();
$nb = $pdo->query('SELECT COUNT(*) FROM agence')->fetchColumn();

echo 'Connexion OK, agences en base : ' . $nb;