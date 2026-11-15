<?php

declare(strict_types=1);

use App\Controller\HomeController;
use App\Core\Router;

// Chargement automatique des classes
require_once __DIR__ . '/../vendor/autoload.php';

$router = new Router();

// Routes de l'application
$router->get('/', HomeController::class, 'index');

$router->dispatch((string) $_SERVER['REQUEST_METHOD'], (string) $_SERVER['REQUEST_URI']);