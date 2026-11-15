-- ============================================================
-- Touche pas au klaxon : script de création de la base
-- Compatible MySQL 8.0.16+ et MariaDB 10.2.1+ (CHECK appliqués)
-- ============================================================

DROP DATABASE IF EXISTS touche_pas_au_klaxon;

CREATE DATABASE touche_pas_au_klaxon
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE touche_pas_au_klaxon;

-- ------------------------------------------------------------
-- Table AGENCE
-- Villes où l'entreprise est implantée (gérées par l'admin).
-- ------------------------------------------------------------
CREATE TABLE agence (
    id_agence INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom       VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_agence),
    UNIQUE KEY uq_agence_nom (nom)
) ENGINE = InnoDB;

-- ------------------------------------------------------------
-- Table UTILISATEUR
-- Employés issus du système RH (aucune création côté appli).
-- Le mot de passe est stocké haché (password_hash en PHP),
-- d'où le VARCHAR(255).
-- ------------------------------------------------------------
CREATE TABLE utilisateur (
    id_utilisateur INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nom            VARCHAR(100) NOT NULL,
    prenom         VARCHAR(100) NOT NULL,
    telephone      VARCHAR(20)  NOT NULL,
    email          VARCHAR(150) NOT NULL,
    mot_de_passe   VARCHAR(255) NOT NULL,
    role           VARCHAR(10)  NOT NULL DEFAULT 'user',
    PRIMARY KEY (id_utilisateur),
    UNIQUE KEY uq_utilisateur_email (email),
    CONSTRAINT ck_utilisateur_role CHECK (role IN ('user', 'admin'))
) ENGINE = InnoDB;

-- ------------------------------------------------------------
-- Table TRAJET
-- id_auteur = personne à contacter pour le trajet.
-- Les clés étrangères sont en RESTRICT : on ne peut pas
-- supprimer une agence ou un utilisateur lié à un trajet.
-- ------------------------------------------------------------
CREATE TABLE trajet (
    id_trajet          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    date_heure_depart  DATETIME     NOT NULL,
    date_heure_arrivee DATETIME     NOT NULL,
    places_total       TINYINT UNSIGNED NOT NULL,
    places_disponibles TINYINT UNSIGNED NOT NULL,
    id_agence_depart   INT UNSIGNED NOT NULL,
    id_agence_arrivee  INT UNSIGNED NOT NULL,
    id_auteur          INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_trajet),

        CONSTRAINT fk_trajet_agence_depart
        FOREIGN KEY (id_agence_depart)  REFERENCES agence (id_agence)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT fk_trajet_agence_arrivee
        FOREIGN KEY (id_agence_arrivee) REFERENCES agence (id_agence)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT fk_trajet_auteur
        FOREIGN KEY (id_auteur)         REFERENCES utilisateur (id_utilisateur)
        ON DELETE RESTRICT ON UPDATE RESTRICT,
        
    -- Règles de cohérence (doublées côté PHP pour les messages d'erreur)
    CONSTRAINT ck_trajet_agences  CHECK (id_agence_depart <> id_agence_arrivee),
    CONSTRAINT ck_trajet_dates    CHECK (date_heure_arrivee > date_heure_depart),
    CONSTRAINT ck_trajet_places   CHECK (places_total > 0
                                         AND places_disponibles <= places_total),

    -- Accélère la requête de l'accueil (tri par date de départ)
    KEY idx_trajet_depart (date_heure_depart)
) ENGINE = InnoDB;