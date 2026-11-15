<?php

declare(strict_types=1);

namespace App\Core;

use PDO;

/**
 * Fournit la connexion PDO unique à la base de données.
 */
class Database
{
    private static ?PDO $instance = null;

    /**
     * Retourne la connexion PDO, créée au premier appel.
     *
     * @return PDO
     */
    public static function getConnection(): PDO
    {
        if (self::$instance === null) {
            /** @var array{host: string, port: int, name: string, user: string, password: string, charset: string} $config */
            $config = require __DIR__ . '/../../config/database.php';

            $dsn = sprintf(
                'mysql:host=%s;port=%d;dbname=%s;charset=%s',
                $config['host'],
                $config['port'],
                $config['name'],
                $config['charset']
            );

            self::$instance = new PDO($dsn, $config['user'], $config['password'], [
                PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES   => false,
            ]);
        }

        return self::$instance;
    }
}