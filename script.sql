CREATE TABLE Salle (
    Salle_ID INT PRIMARY KEY NOT NULL,
    Nom VARCHAR(50),
    capacite VARCHAR(50)
)


CREATE TABLE equipements (
    Equipement_ID INT PRMARY KEY NOT NULL,
    Nom VARCHAR(50)
)

CREATE TABLE Employe (
    Employe_ID INT PRIMARY KEY NOT NULL,
    Nom VARCHAR(50),
    Email VARCHAR(50),
    Departement VARCHAR(50),
    Post VARCHAR(50)
)


CREATE TABLE Reservation (
    Reservation_ID INT PRIMARY KEY NOT NULL,
   Date_de_debut DATE,
    Date_de_fin DATE
    
)
ALTER TABLE salle ADD CONSTRAINT equipements_ID FOREIGN KEY REFERENCES equipements(Equipement_ID);