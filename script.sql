
--CREATION DE BASE DE DONNEES BOOKIFY :
CREATE DATABASE bookify;

--CREATION DE TABLE SALLE :
CREATE TABLE Salle (
    id INT PRIMARY KEY ,
    nom VARCHAR(50) NOT NULL,
    capacite INT
)

--CREATION DE TABLE EQUIPEMENT :

CREATE TABLE equipements (
    id INT PRIMARY KEY ,
    Nom VARCHAR(50) NOT NULL,
    salle_id INT,
   FOREIGN KEY (salle_id) REFERENCES salle (id)

)
--CREATION DE TABLE EMPLOYE :
CREATE TABLE Employe (
    id INT PRIMARY KEY ,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    departement VARCHAR(50) NOT NULL,
    post VARCHAR(50) NOT NULL
)

--CREATION DE TABLE RESERVATION :
CREATE TABLE Reservation (
  id INT PRIMARY KEY,
   date_de_debut DATE,
  date_de_fin DATE,
  salle_id INT,
  employe_id INT,
   FOREIGN KEY (salle_id) REFERENCES salle (id),
  FOREIGN KEY (employe_id) REFERENCES employe (id)  
)



--CREATION D'INDEX DES ID:
CREATE INDEX idx_id_salle
ON salle (id);

CREATE INDEX idx_id_employe
ON employe (id);

CREATE INDEX idx_id_reservation
ON reservation (id);

CREATE INDEX idx_id_employe
ON employe (id);

CREATE INDEX idx_id_equipement
ON equipements (id);



-- INSERTION DES DONNEES SUR LA TABLE SALLE :
 INSERT INTO salle (id , nom , capacite) VALUES (01,'salle 01' , 50);
 INSERT INTO salle (id , nom , capacite) VALUES (02,'salle 02' , 100);
 INSERT INTO salle (id , nom , capacite) VALUES (03,'salle 03' , 50);
 INSERT INTO salle (id , nom , capacite) VALUES (04,'salle 04' , 40);
 INSERT INTO salle (id , nom , capacite) VALUES (05,'salle 05' , 80);
 INSERT INTO salle (id , nom , capacite) VALUES (06,'salle 06' , 40);



-- INSERTION DES DONNEES SUR LA TABLE EMPLOYE :
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (01,'fatima ezahrae adardor' , 'fatima@gmail.com', 'A1' , 'P111');
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (02,'aicha aloufi' , 'aicha@gmail.com', 'A2' , 'P122');
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (03,'ahmad ali' , 'ahmad@gmail.com','A3' , 'P321');
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (04,'ilhame boumrour' , 'ilham@gmail.com', 'A4' , 'P435');
  INSERT INTO employe (id , nom , email , departement , post ) VALUES (05,'achraf asfarah' , 'achraf@gmail.com', 'A4' , 'P985');



-- INSERTION DES DONNEES SUR LA TABLE RESERVATION :
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (01,'2023-11-16' , '2023-11-17', 01 ,03);
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (02,'2023-11-20' , '2023-11-21', 03 ,01);
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (03,'2023-12-10' , '2023-11-11', 04 ,02);
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (04,'2023-12-22' , '2023-12-23', 02 ,02);



-- INSERTION DES DONNEES SUR LA TABLE EQUIPEMENT :
 INSERT INTO equipements (id , nom ,salle_id) VALUES (01,'chaise' , 02);
 INSERT INTO equipements (id , nom ,salle_id) VALUES (02,'datashow' , 04);
 INSERT INTO equipements (id , nom ,salle_id) VALUES (03,'pc portable' , 01);
 INSERT INTO equipements (id , nom ,salle_id) VALUES (04,'tableau blanc' , 03);


--mis à jour les informations de l'employé avec l'identifiant 03 en changeant le nom en 'Jad Amir' et l'adresse e-mail en 'jad@gmail.com'."
UPDATE employe SET nom ='jad amir' AND email='jad@gmail.com' WHERE id =03;


--supprimé l'entrée correspondant à l'identifiant 06 dans la table 'salle'.
DELETE FROM salle WHERE id = 06;



--électionner le nom de l'employé ayant l'identifiant 01 dans la table 'employe'.
 SELECT nom FROM employe WHERE id =01;

 --sélectionner toutes les informations des salles ayant une capacité de 50, regroupées par identifiant, dans la table 'salle
 SELECT * FROM salle WHERE capacite=50 GROUP BY id;

 --sélectionner l'identifiant, le nom et le nombre d'équipements pour la salle ayant l'identifiant 04 dans la table 'equipements'
 SELECT id , nom ,COUNT(*)AS nomrbre_salles FROM equipements WHERE salle_id =04;

 --sélectionner toutes les informations des réservations dont la date de début est entre le 1er et le 30 décembre 2023, triées par identifiant en ordre décroissant, dans la table 'reservation'
 SELECT * FROM reservation WHERE date_de_debut BETWEEN '2023-12-01' AND '2023-12-30' ORDER BY id DESC ;


SELECT s.nom, e.nom , s.capacite FROM salle s INNER JOIN equipements e ON (s.id = e.salle_id) ORDER BY s.capacite ASC;
 SELECT em.nom, em.email ,s.nom , r.date_de_debut , r.date_de_fin FROM salle s INNER JOIN reservation r ON (s.id = r.salle_id) INNER JOIN employe em ON (r.employe_id = em.id);
 SELECT * FROM reservation r INNER JOIN employe em USING (id) ;
 SELECT r.* FROM employe em INNER JOIN reservation r ON (em.id=r.employe_id) AND em.nom='fatima ezahrae adardor';


 SELECT * FROM salle WHERE capacite  IN (SELECT AVG(capacite) AS moyenne FROM salle HAVING moyenne>100 );
  SELECT * FROM salle WHERE capacite  NOT IN (SELECT AVG(capacite) AS moyenne FROM salle HAVING moyenne>100 );
  SELECT id , date_de_debut, date_de_fin FROM reservation WHERE employe_id =(SELECT id FROM employe WHERE id=02);


