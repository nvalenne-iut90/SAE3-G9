DROP TABLE IF EXISTS formulaire;
DROP TABLE IF EXISTS avis_attraction CASCADE;
DROP TABLE IF EXISTS avis_stand CASCADE;
DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS service_stand CASCADE;
DROP TABLE IF EXISTS service_attraction CASCADE;
DROP TABLE IF EXISTS stand CASCADE;
DROP TABLE IF EXISTS attraction CASCADE;
DROP TABLE IF EXISTS billet CASCADE;
DROP TABLE IF EXISTS produit CASCADE;
DROP TABLE IF EXISTS service CASCADE;
DROP TABLE IF EXISTS compte CASCADE;
DROP TABLE IF EXISTS type_attraction CASCADE;
DROP TABLE IF EXISTS type_stand CASCADE;
DROP TABLE IF EXISTS emplacement CASCADE;

CREATE TABLE emplacement(
   id_emplacement SERIAL,
   prix DECIMAL(6,2),
   taille DECIMAL(6,2),
   PRIMARY KEY(id_emplacement)
);

CREATE TABLE type_stand(
   id_type_stand SERIAL,
   designation VARCHAR(50),
   PRIMARY KEY(id_type_stand)
);

CREATE TABLE type_attraction(
   id_type_attraction SERIAL,
   designation VARCHAR(50),
   PRIMARY KEY(id_type_attraction)
);

CREATE TABLE compte(
   id_compte SERIAL,
   identifiant VARCHAR(50),
   mdp VARCHAR(255),
   mail VARCHAR(50),
   nom VARCHAR(50),
   role VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(id_compte)
);

CREATE TABLE service(
   id_service SERIAL,
   nom_service VARCHAR(50),
   PRIMARY KEY(id_service)
);

CREATE TABLE produit(
   id_produit SERIAL,
   nom_produit VARCHAR(50),
   PRIMARY KEY(id_produit)
);

CREATE TABLE billet(
    id_billet SERIAL,
    dateBillet DATE,
    prix SMALLINT,
    id_compte INTEGER NOT NULL,
    PRIMARY KEY (id_billet),
    FOREIGN KEY (id_compte) REFERENCES compte(id_compte) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE attraction(
   id_attraction SERIAL,
   nom VARCHAR(50),
   prix_adulte DECIMAL(5,2),
   prix_enfant DECIMAL(5,2),
   taille_requise DECIMAL(3,2),
   recette DECIMAL(6,2),
   nbr_clients_total INT,
   attente INT,
   id_type_attraction INT NOT NULL,
   id_compte INT NOT NULL,
   id_emplacement INT NOT NULL,
   FOREIGN KEY(id_type_attraction) REFERENCES type_attraction(id_type_attraction) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_compte) REFERENCES compte(id_compte) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_emplacement) REFERENCES emplacement(id_emplacement) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY(id_attraction)
);

CREATE TABLE stand(
   id_stand SERIAL,
   nom VARCHAR(50),
   prix DECIMAL(5,2),
   recette DECIMAL(6,2),
   nbr_clients_total INT,
   attente INT,
   id_type_stand INT NOT NULL,
   id_compte INT NOT NULL,
   id_emplacement INT NOT NULL,
   FOREIGN KEY(id_type_stand) REFERENCES type_stand(id_type_stand) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_compte) REFERENCES compte(id_compte) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_emplacement) REFERENCES emplacement(id_emplacement) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY(id_stand)
);

CREATE TABLE service_stand(
   id_stand INT,
   id_service INT,
   FOREIGN KEY(id_stand) REFERENCES stand(id_stand) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_service) REFERENCES service(id_service) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY(id_stand, id_service)
);

CREATE TABLE service_attraction(
    id_attraction INT,
    id_service INT,
    FOREIGN KEY(id_attraction) REFERENCES attraction(id_attraction) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_service) REFERENCES service(id_service) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(id_attraction, id_service)
);

CREATE TABLE menu(
   id_stand INT,
   id_produit INT,
   FOREIGN KEY(id_stand) REFERENCES stand(id_stand) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(id_produit) REFERENCES produit(id_produit) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY(id_stand, id_produit)
);
CREATE TABLE avis_stand(
    id_stand INT,
    id_compte INT,
    message VARCHAR,
    note SMALLINT,
    date DATE,
    FOREIGN KEY(id_stand) REFERENCES stand(id_stand) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_compte) REFERENCES compte(id_compte) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id_stand, id_compte, date)
);

CREATE TABLE avis_attraction(
    id_attraction INT,
    id_compte INT,
    message VARCHAR,
    note SMALLINT,
    date DATE,
    FOREIGN KEY(id_attraction) REFERENCES attraction(id_attraction) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_compte) REFERENCES compte(id_compte) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id_attraction, id_compte, date)
);

CREATE TABLE formulaire(
    id_formulaire INT,
    email VARCHAR,
    prenom VARCHAR,
    nom VARCHAR,
    message VARCHAR(255),
    PRIMARY KEY (id_formulaire)
);



INSERT INTO emplacement (prix, taille) VALUES
(10,100),
(10,100),
(10,100),
(10,100),
(10,100),
(10,100),
(10,100),
(10,100),
(10,100)
;

INSERT INTO type_stand (designation) VALUES
('p??che aux canards'),
('manger');

INSERT INTO type_attraction (designation) VALUES
('grand huit'),
('auto-tamponneuses'),
('rivi??re canadienne'),
('grande roue'),
('maison hant??e'),
('maison des pi??ges'),
('centrigugeuse'),
('tour infernale'),
('reverse bungee'),
('bulles sur eau');

INSERT INTO compte (identifiant, mdp, mail, nom, role, prenom) VALUES
('admin1','1234','admin1@gmail.com','Jean','admin','Michel'),
('admin2','abcd','admin2@gmail.com','Philippe','admin','Martin'),
('prestataire1','1234','prestataire1@gmail.com','Jacques','prestataire','Max'),
('prestataire2','abcd','prestataire2@gmail.com','Elizabeth','prestataire','Carl'),
('prestataire3','1234','prestataire3@gmail.com','Ryan','prestataire','Poupou'),
('prestataire4','abcd','prestataire4@gmail.com','Steven','prestataire','I');

INSERT INTO service (nom_service) VALUES
('prix ?? gagner'),
('vente de nourriture'),
('vente de goodies'),
('consigne'),
('cadeaux ?? gagner'),
('acc??s mobilit?? r??duite');

INSERT INTO produit (nom_produit) VALUES
('churros'),
('barbe a papa');

INSERT INTO attraction(nom, prix_adulte, prix_enfant
                        , taille_requise, recette, nbr_clients_total
                        , attente, id_type_attraction, id_compte
                        , id_emplacement) VALUES
('d??gueulator',10,8,1.3,0,0,0,7,3,1),
('space mountains',10,8,1.3,0.,0,0,1,3,2),
('rapide et furieux',10,8,1.3,0,0,0,1,4,3),
('splash',10,8,1.3,0,0,0,3,5,4),
('Spaceglider',10,8,1.3,0,0,0,6,6,5);

INSERT INTO stand (nom, prix, recette, nbr_clients_total, attente, id_type_stand, id_compte, id_emplacement) VALUES
('canards',10,0,0,0,1,3,6),
('carabine',10,0,0,0,1,3,7),
('basket',10,0,0,0,1,4,8),
('I',0,0,0,0,2,4,9);

INSERT INTO menu(id_stand,id_produit) VALUES
(4,1),
(4,2);

