-- ============================================================
-- Touche pas au klaxon : jeu d'essais.
-- Mot de passe de tous les comptes de test : Klaxon2024
-- (stocké haché en bcrypt, comme le fera password_hash en PHP)
-- ============================================================

USE touche_pas_au_klaxon;

-- ------------------------------------------------------------
-- Agences (fichier agences.txt)
-- ------------------------------------------------------------
INSERT INTO agence (nom) VALUES
    ('Paris'),
    ('Lyon'),
    ('Marseille'),
    ('Toulouse'),
    ('Nice'),
    ('Nantes'),
    ('Strasbourg'),
    ('Montpellier'),
    ('Bordeaux'),
    ('Lille'),
    ('Rennes'),
    ('Reims');

-- ------------------------------------------------------------
-- Utilisateurs (fichier users.txt : nom, prénom, téléphone, email)
-- Rôle user par défaut, mot de passe commun pour les tests.
-- ------------------------------------------------------------
INSERT INTO utilisateur (nom, prenom, telephone, email, mot_de_passe) VALUES
    ('Martin',    'Alexandre', '0612345678', 'alexandre.martin@email.fr',  '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Dubois',    'Sophie',    '0698765432', 'sophie.dubois@email.fr',     '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Bernard',   'Julien',    '0622446688', 'julien.bernard@email.fr',    '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Moreau',    'Camille',   '0611223344', 'camille.moreau@email.fr',    '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Lefèvre',   'Lucie',     '0777889900', 'lucie.lefevre@email.fr',     '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Leroy',     'Thomas',    '0655443322', 'thomas.leroy@email.fr',      '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Roux',      'Chloé',     '0633221199', 'chloe.roux@email.fr',        '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Petit',     'Maxime',    '0766778899', 'maxime.petit@email.fr',      '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Garnier',   'Laura',     '0688776655', 'laura.garnier@email.fr',     '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Dupuis',    'Antoine',   '0744556677', 'antoine.dupuis@email.fr',    '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Lefebvre',  'Emma',      '0699887766', 'emma.lefebvre@email.fr',     '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Fontaine',  'Louis',     '0655667788', 'louis.fontaine@email.fr',    '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Chevalier', 'Clara',     '0788990011', 'clara.chevalier@email.fr',   '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Robin',     'Nicolas',   '0644332211', 'nicolas.robin@email.fr',     '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Gauthier',  'Marine',    '0677889922', 'marine.gauthier@email.fr',   '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Fournier',  'Pierre',    '0722334455', 'pierre.fournier@email.fr',   '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Girard',    'Sarah',     '0688665544', 'sarah.girard@email.fr',      '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Lambert',   'Hugo',      '0611223366', 'hugo.lambert@email.fr',      '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Masson',    'Julie',     '0733445566', 'julie.masson@email.fr',      '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO'),
    ('Henry',     'Arthur',    '0666554433', 'arthur.henry@email.fr',      '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO');

-- ------------------------------------------------------------
-- Compte administrateur (absent du fichier RH)
-- ------------------------------------------------------------
INSERT INTO utilisateur (nom, prenom, telephone, email, mot_de_passe, role) VALUES
    ('Admin', 'Klaxon', '0600000000', 'admin@klaxon.fr',
     '$2y$10$ao0/LlAYYzAbSQSAhwBpQuLVjQRGMcwKcxc23R2E2RamLKrAXmwaO', 'admin');

-- ------------------------------------------------------------
-- Trajets
-- Dates calculées à partir d'aujourd'hui pour rester dans le futur.
-- Colonnes : départ, arrivée, places totales, places libres,
--            agence de départ, agence d'arrivée, auteur.
-- ------------------------------------------------------------
INSERT INTO trajet
    (date_heure_depart, date_heure_arrivee, places_total, places_disponibles,
     id_agence_depart, id_agence_arrivee, id_auteur)
VALUES
    -- Trajets à venir avec des places libres
    (TIMESTAMP(CURDATE() + INTERVAL 1 DAY, '08:00:00'), TIMESTAMP(CURDATE() + INTERVAL 1 DAY, '12:00:00'), 4, 3,  1,  2,  1),  -- Paris > Lyon
    (TIMESTAMP(CURDATE() + INTERVAL 1 DAY, '14:00:00'), TIMESTAMP(CURDATE() + INTERVAL 1 DAY, '17:00:00'), 3, 2,  2,  3,  2),  -- Lyon > Marseille
    (TIMESTAMP(CURDATE() + INTERVAL 2 DAY, '07:30:00'), TIMESTAMP(CURDATE() + INTERVAL 2 DAY, '10:30:00'), 4, 4,  4,  9,  3),  -- Toulouse > Bordeaux
    (TIMESTAMP(CURDATE() + INTERVAL 2 DAY, '09:00:00'), TIMESTAMP(CURDATE() + INTERVAL 2 DAY, '10:30:00'), 3, 1,  6, 11,  4),  -- Nantes > Rennes
    (TIMESTAMP(CURDATE() + INTERVAL 3 DAY, '06:45:00'), TIMESTAMP(CURDATE() + INTERVAL 3 DAY, '09:15:00'), 4, 2, 10,  1,  5),  -- Lille > Paris
    (TIMESTAMP(CURDATE() + INTERVAL 3 DAY, '13:00:00'), TIMESTAMP(CURDATE() + INTERVAL 3 DAY, '16:30:00'), 3, 3,  7, 12,  6),  -- Strasbourg > Reims
    (TIMESTAMP(CURDATE() + INTERVAL 4 DAY, '10:00:00'), TIMESTAMP(CURDATE() + INTERVAL 4 DAY, '12:30:00'), 4, 1,  3,  5,  7),  -- Marseille > Nice
    (TIMESTAMP(CURDATE() + INTERVAL 5 DAY, '16:00:00'), TIMESTAMP(CURDATE() + INTERVAL 5 DAY, '18:30:00'), 3, 2,  8,  4,  8),  -- Montpellier > Toulouse
    -- Trajet complet : ne doit pas apparaître sur l'accueil
    (TIMESTAMP(CURDATE() + INTERVAL 6 DAY, '08:15:00'), TIMESTAMP(CURDATE() + INTERVAL 6 DAY, '11:45:00'), 4, 0,  9,  6,  9),  -- Bordeaux > Nantes
    -- Trajet passé : ne doit pas apparaître sur l'accueil
    (TIMESTAMP(CURDATE() - INTERVAL 2 DAY, '09:00:00'), TIMESTAMP(CURDATE() - INTERVAL 2 DAY, '11:30:00'), 3, 2, 12, 10, 10);  -- Reims > Lille