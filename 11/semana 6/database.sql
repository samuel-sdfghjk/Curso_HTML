CREATE DATABASE musica;

CREATE TABLE artista(
    id int(3) PRIMARY KEY,
    nombres varchar(100),
    apellidos varchar(100),
    nombre_artisco varchar(100),
    fecha_nacimiento date,
    sexo enum("femenino", "masculino", "otro")
);


CREATE TABLE genero_musical(
    id int(3) PRIMARY KEY,
    nombre varchar(100),
    descripcion varchar(300)
);



CREATE TABLE album (
    id int(3) PRIMARY KEY,
    nombre varchar(100),
    artista varchar(100),
    fecha_lanzamiento date,
    caratula BLOB
);

CREATE TABLE cancion(
    id int(4)PRIMARY KEY,
    nombre varchar(100),
    duracion int(4),
    fecha_lanzamiento date,
    valoracion int(1)
);

CREATE TABLE cancion_album(
    id_cancion int(4) NOT NULL,
    id_album int(3) NOT NULL,
    FOREIGN KEY (id_cancion) REFERENCES cancion(id),
    FOREIGN KEY (id_album) REFERENCES album(id)

);

CREATE TABLE genero_cancion(
    id_genero_musical int(3)NOT NULL,
    id_cancion int(3) NOT NULL,
    FOREIGN KEY (id_genero_musical) REFERENCES genero_musical(id),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id)
);

CREATE TABLE genero_artista(
    id_genero_musical int(3)NOT NULL,
    id_artista int(3) NOT NULL,
    FOREIGN KEY (id_genero_musical) REFERENCES genero_musical(id),
    FOREIGN KEY (id_artista) REFERENCES artista(id)
);