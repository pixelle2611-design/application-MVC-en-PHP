<?php

declare(strict_types=1);

namespace App\Core;

/**
 * Associe une URL à une action de contrôleur.
 */
class Router
{
    /**
     * Routes enregistrées, classées par méthode HTTP puis par chemin.
     *
     * @var array<string, array<string, array{0: string, 1: string}>>
     */
    private array $routes = [];

    /**
     * Enregistre une route accessible en GET.
     *
     * @param string $path       Chemin de l'URL (ex : "/")
     * @param string $controller Nom complet de la classe du contrôleur
     * @param string $action     Méthode du contrôleur à appeler
     */
    public function get(string $path, string $controller, string $action): void
    {
        $this->routes['GET'][$path] = [$controller, $action];
    }

    /**
     * Enregistre une route accessible en POST.
     *
     * @param string $path       Chemin de l'URL
     * @param string $controller Nom complet de la classe du contrôleur
     * @param string $action     Méthode du contrôleur à appeler
     */
    public function post(string $path, string $controller, string $action): void
    {
        $this->routes['POST'][$path] = [$controller, $action];
    }

    /**
     * Appelle l'action correspondant à la requête, ou renvoie une 404.
     *
     * @param string $httpMethod Méthode HTTP de la requête (GET, POST)
     * @param string $uri        URI demandée, paramètres inclus
     */
    public function dispatch(string $httpMethod, string $uri): void
    {
        $path = parse_url($uri, PHP_URL_PATH);
        $path = '/' . trim(is_string($path) ? $path : '', '/');

        $route = $this->routes[$httpMethod][$path] ?? null;

        if ($route === null) {
            http_response_code(404);
            echo 'Page introuvable';
            return;
        }

        [$controllerClass, $action] = $route;

        $controller = new $controllerClass();
        $controller->$action();
    }
}