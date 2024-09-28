DROP DATABASE  if exists animales_cuidadores;

CREATE DATABASE animales_cuidadores;

USE animales_cuidadores;

CREATE TABLE ESPECIES (
	idEspecie INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (45) NOT NULL,
	nombreCientifico VARCHAR (45) NOT NULL,
	familia VARCHAR (45)
);
CREATE TABLE HABITATS (
	idHabitat INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (45) NOT NULL,
	descripcion VARCHAR (45),
	capacidad INT NOT NULL
);
CREATE TABLE ANIMALES( 
	idAnimal INT AUTO_INCREMENT PRIMARY KEY,
	nombre    VARCHAR (45) NOT NULL,
	fechaNacimiento DATETIME NOT NULL,
	genero 	  VARCHAR (45) NOT NULL,
	idEspecie INT NOT NULL,
	idHabitat INT NOT NULL,	
	FOREIGN KEY (idEspecie) REFERENCES ESPECIES(idEspecie),
	FOREIGN KEY (idHabitat) REFERENCES HABITATS (idHabitat)
);
CREATE TABLE CUIDADOR (
	nombre VARCHAR (45) NOT NULL,
	apellidos VARCHAR (45) NOT NULL,
	clave VARCHAR (45) PRIMARY KEY, 
	email VARCHAR (45) NOT NULL, 
	telefono VARCHAR (45) NOT NULL,
	Super Boolean NOT NULL
);
CREATE TABLE ASIGNACION (
	email VARCHAR (45) NOT NULL,
	idAnimal INT NOT NULL,
	PRIMARY KEY ( email, idAnimal),
	FOREIGN KEY (email) REFERENCES CUIDADOR(email),
	FOREIGN KEY (idAnimal) REFERENCES ANIMALES(idAnimal)
);
INSERT INTO ANIMALES (nombre, fechaNacimiento, genero, idEspecie, idHabitat) VALUES 
('León', '1988-09-23', 'masculino', 1, 1),
('Anaconda', '2020-09-11', 'femenina', 2, 2),
('Tiburon', '2017-01-17', 'masculino', 3, 3),
('Golondrina', '2021-03-19', 'masculino', 4, 4),
('Elefante', '2011-11-11', 'femenina', 5, 5);
INSERT INTO CUIDADOR (nombre, apellidos ,clave, email, telefono, Super) VALUES 
('Ana', 'Ramos', '123' ,'anaramos@gmil.com', '654765567' ,'0'),
('Ezequiel', 'Garcia', '345', 'Ezemir@gmil.com', '876657775','0'),
('Super','Super', '000', 'Super@gmil.com', '000000000','1' );

INSERT INTO HABITATS (nombre, descripcion, capacidad) VALUES 
('Rejas', 'solo para cuatro patas', 55),
('Agua', 'solo para aletas', 23);

INSERT INTO ASIGNACION ( email, idAnimal) VALUES 
('anaramos@gmil.com', 1 ),('anaramos@gmil.com', 2 ),('anaramos@gmil.com', 3 ),
('Ezemir@gmil.com' ,2 );
