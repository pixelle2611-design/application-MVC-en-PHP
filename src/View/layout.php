<?php
/**
 * Gabarit commun à toutes les pages.
 *
 * @var string $content Contenu de la vue
 * @var string $title   Titre de la page
 */
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?= htmlspecialchars($title ?? 'Touche pas au klaxon', ENT_QUOTES, 'UTF-8') ?></title>
    <link rel="stylesheet" href="/css/main.css">
</head>
<body class="d-flex flex-column min-vh-100">

    <header class="container mt-3">
        <nav class="navbar navbar-expand bg-light border border-2 border-dark rounded-4 px-3">
            <h1 class="navbar-brand h5 mb-0">Touche pas au klaxon</h1>
            <a class="btn btn-dark ms-auto" href="/connexion">Connexion</a>
        </nav>
    </header>

    <main class="container flex-grow-1 mt-4">
        <?= $content ?>
    </main>

    <footer class="container text-center py-3">
        <span>© <?= date('Y') ?> - Touche pas au klaxon</span>
    </footer>

</body>
</html>