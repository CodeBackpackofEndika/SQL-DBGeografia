CREATE TABLE localidades (
  id_localidad NUMBER(5) CONSTRAINT localidades_pk PRIMARY KEY,
  nombre       VARCHAR(50) CONSTRAINT localidades_nn1 NOT NULL,
  poblacion    NUMBER(8),
  n_provincia  NUMBER(2) CONSTRAINT localidades_nn2 NOT NULL
);

CREATE TABLE comunidades (
  id_comunidad NUMBER(2) CONSTRAINT comunidades_pk PRIMARY KEY,
  nombre VARCHAR2(25) CONSTRAINT comunidades_uk1 UNIQUE
                      CONSTRAINT comunidades_nn1 NOT NULL,
  id_capital NUMBER(5) CONSTRAINT comunidades_uk2 UNIQUE
                      CONSTRAINT comunidades_nn2 NOT NULL
                      CONSTRAINT comunidades_fk1 REFERENCES localidades(id_localidad),
  max_provincias NUMBER(1)
);
CREATE TABLE provincias (
  n_provincia  NUMBER(2) CONSTRAINT provincias_pk PRIMARY KEY,
  nombre       VARCHAR2(25) CONSTRAINT provincias_uk1 UNIQUE
    CONSTRAINT provincias_nn1 NOT NULL,
  superficie   NUMBER(5),
  id_capital   NUMBER(5) CONSTRAINT provincias_fk1 REFERENCES localidades(id_localidad)
    CONSTRAINT provincias_uk2 UNIQUE
    CONSTRAINT provincias_nn2 NOT NULL,
  id_comunidad NUMBER(2) CONSTRAINT provincias_fk2 REFERENCES comunidades(id_comunidad)
    CONSTRAINT provincias_nn3 NOT NULL
);

ALTER TABLE localidades ADD n_provincias CONSTRAINT localidades_fk1 REFERENCES provincias;

drop table comunidades CASCADE CONSTRAINT;
drop table localidades CASCADE CONSTRAINT;
drop table provincias CASCADE CONSTRAINT;



