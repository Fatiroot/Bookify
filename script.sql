CREATE DATABASE bookify;


CREATE TABLE Salle (
    id INT PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    capacite INT
)


CREATE TABLE equipements (
    id INT PRIMARY KEY NOT NULL,
    Nom VARCHAR(50) NOT NULL,
    salle_id INT,
   FOREIGN KEY (salle_id) REFERENCES salle (id)

)

CREATE TABLE Employe (
    id INT PRIMARY KEY NOT NULL,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    departement VARCHAR(50) NOT NULL,
    post VARCHAR(50) NOT NULL
)


CREATE TABLE Reservation (
  id INT PRIMARY KEY NOT NULL,
   date_de_debut DATE,
  date_de_fin DATE,
  salle_id INT,
  employe_id INT,
   FOREIGN KEY (salle_id) REFERENCES salle (id),
  FOREIGN KEY (employe_id) REFERENCES employe (id)  
)


-- INSERTION DES DONNEES
 INSERT INTO salle (id , nom , capacite) VALUES (01,'salle 01' , 50);
 INSERT INTO salle (id , nom , capacite) VALUES (02,'salle 02' , 100);
 INSERT INTO salle (id , nom , capacite) VALUES (03,'salle 03' , 50);
 INSERT INTO salle (id , nom , capacite) VALUES (04,'salle 04' , 40);

 INSERT INTO employe (id , nom , email , departement , post ) VALUES (01,'fatima ezahrae adardor' , 'fatima@gmail.com', 'A1' , 'P111');
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (02,'aicha aloufi' , 'aicha@gmail.com', 'A2' , 'P122');
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (03,'ahmad ali' , 'ahmad@gmail.com','A3' , 'P321');
 INSERT INTO employe (id , nom , email , departement , post ) VALUES (04,'ilhame boumrour' , 'ilham@gmail.com', 'A4' , 'P435');


 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (01,'2023-11-16' , '2023-11-17', 01 ,03);
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (02,'2023-11-20' , '2023-11-21', 03 ,01);
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (03,'2023-12-10' , '2023-11-11', 04 ,02);
 INSERT INTO reservation (id ,date_de_debut, date_de_fin , salle_id, employe_id) VALUES (04,'2023-12-22' , '2023-12-23', 02 ,02);


 INSERT INTO equipements (id , nom ,salle_id) VALUES (01,'chaise' , 02);
 INSERT INTO equipements (id , nom ,salle_id) VALUES (02,'datashow' , 04);
 INSERT INTO equipements (id , nom ,salle_id) VALUES (03,'pc portable' , 01);
 INSERT INTO equipements (id , nom ,salle_id) VALUES (04,'tableau blanc' , 03);
