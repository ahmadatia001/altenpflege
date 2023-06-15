-- SQLINES DEMO *** 7212611
-- SQLINES DEMO *** 7215779
-- SQLINES DEMO *** m  	7212944



DROP TABLE altenpfleger CASCADE CONSTRAINTS;
DROP TABLE dienst CASCADE CONSTRAINTS;
DROP TABLE patient CASCADE CONSTRAINTS;
DROP TABLE arzt CASCADE CONSTRAINTS;
DROP TABLE adresse CASCADE CONSTRAINTS;
DROP TABLE arzt_has_patient CASCADE CONSTRAINTS;




-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE altenpfleger(
id_altenpfleger BIGINT NOT NULL PRIMARY KEY,
anrede         	CHARACTER(4) 	NOT NULL  CHECK (Anrede IN ('Herr','Frau')),
nachname       	VARCHAR(50)	NOT NULL,
vorname        	VARCHAR(50)	NOT NULL,
geburtsdatum   	DATE		NOT NULL,
mail	       	VARCHAR(50)	CHECK (REGEXP_LIKE(mail, '[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}')),	
tel            	BIGINT     	DEFAULT 492223334444 NOT NULL CHECK (REGEXP_LIKE(tel, '^[0-9]{11,15}'))
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE patient(
id_patient     	BIGINT NOT NULL PRIMARY KEY,	
anrede         	CHARACTER(4)	CHECK (Anrede IN ('Herr','Frau')),
nachname       	VARCHAR(30)	NOT NULL,
vorname        	VARCHAR(50)	NOT NULL,
KVnummer       	VARCHAR(10)  	NOT NULL,
geburtsdatum   	DATE		NOT NULL
); 


-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE dienst(
altenpfleger_id_altenpfleger 	BIGINT	NOT NULL,
patient_id_patient         	BIGINT	NOT NULL,
arbeitsbeginn              	TIMESTAMP	NOT NULL,
arbeitsende                	TIMESTAMP	NOT NULL,
PRIMARY KEY   			(altenpfleger_id_altenpfleger, patient_id_patient) 

);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE arzt(
id_arzt        		BIGINT NOT NULL PRIMARY KEY,
vertretung_id_arzt 	BIGINT,
anrede         		CHARACTER(4)   		NOT NULL  CHECK (anrede IN ('Herr','Frau')),
nachname       		VARCHAR(50)		NOT NULL,
vorname        		VARCHAR(50)		NOT NULL,
mail	       		VARCHAR(50)		CHECK (REGEXP_LIKE(mail, '[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+.[A-Za-z]{2,4}')),		
tel            		BIGINT        	CHECK (REGEXP_LIKE(tel, '[0-9]{11,15}')),
spezialitaet    	VARCHAR(50)    		CHECK (spezialitaet IN ('Allgemeinmedizin','Hautarzt','Neurologie','Physiologie'))

);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE adresse (
id_adresse	  	BIGINT	NOT NULL PRIMARY KEY,
id_patient        	BIGINT	NOT NULL,
strasse            	VARCHAR(50)	NOT NULL,
hausnummer        	VARCHAR(10)	NOT NULL,
ort               	VARCHAR(45)  	NOT NULL,
plz               	CHARACTER(5) 	CHECK (plz BETWEEN 0 AND 99999)
);

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE arzt_has_patient(
arzt_id_arzt            BIGINT 	NOT NULL,
patient_id_patient      BIGINT 	NOT NULL,
krankheit               VARCHAR(45) 	NOT NULL,
wunschtermin            TIMESTAMP 	NOT NULL,
PRIMARY KEY   		(arzt_id_arzt , patient_id_patient)
); 

-- SQLINES DEMO *** altenpfleger
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO altenpfleger VALUES (1, 'Frau', 'Meit', 'Lisa', '1988-11-17', 'lisameit78@gmail.com', '015736306884');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO altenpfleger VALUES (2, 'Herr', 'Maxwel', 'Alberto', '1989-03-14', 'albertmax79@gmail.com', '015739157884');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO altenpfleger VALUES (3, 'Frau', 'Hartmann', 'Maria', '1997-11-07', 'mariahart@gmail.com', '018456306884');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO altenpfleger VALUES (4, 'Frau', 'Curie', 'Linda', '1994-11-07', 'lindacurie@gmail.com', '015732156884');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO altenpfleger VALUES (5, 'Herr', 'Meier', 'Massimo', '1987-12-24', 'massimomeier@gmail.com', '015736306457');

-- SQLINES DEMO *** patient
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO patient VALUES (1, 'Frau', 'Stein', 'Louisa', 'A145798420', '1978-11-17');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO patient VALUES (2, 'Herr', 'Meit', 'Mahmet', 'A475169875', '1958-12-28');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO patient VALUES (3, 'Frau', 'Raffou', 'Karen', 'A157894512', '1966-11-17');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO patient VALUES (4, 'Herr', 'Dewest', 'Pascal', 'A849756213', '1956-11-17');

-- SQLINES DEMO *** dienst
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO dienst VALUES (1, 2, '2022-11-17 08:00:00', '2022-11-17 15:00:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO dienst VALUES (2, 3, '2022-11-17 09:00:00', '2022-11-17 16:00:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO dienst VALUES (3, 1, '2022-11-17 08:30:00', '2022-11-17 15:30:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO dienst VALUES (4, 2, '2022-11-17 10:00:00', '2022-11-17 17:00:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO dienst VALUES (5, 4, '2022-11-17 09:15:00', '2022-11-17 16:15:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO dienst VALUES (1, 3, '2022-11-17 10:30:00', '2022-11-17 15:30:00');

-- SQLINES DEMO *** arzt
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt VALUES (1, NULL, 'Frau', 'Lyam', 'Jarvia', 'lyamjarv@gmail.com', '015748306884', 'Physiologie');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt VALUES (2, 1, 'Frau', 'Zelda', 'Alicia', 'zeldaali@gmail.com', '015732216884', 'Allgemeinmedizin');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt VALUES (3, 2, 'Herr', 'Aube', 'Riccardo', 'aubericc@gmail.com', '015736307204', 'Hautarzt');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt VALUES (4, 1, 'Herr', 'Merrick', 'Frank', 'frankmerr@gmail.com', '015731578194', 'Neurologie');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt VALUES (5, NULL, 'Frau', 'Rella', 'Robina', 'robinarella@gmail.com', '015736154920', 'Physiologie');

-- SQLINES DEMO *** adresse
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO adresse VALUES (1, 2, 'Berlinerstr.', 15, 'Dortmund', '44109');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO adresse VALUES (2, 1, 'Eisenbahnstr.', 22, 'Dortmund', '44135');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO adresse VALUES (3, 3, 'Lippstädte', 82, 'Lünen', '44532');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO adresse VALUES (4, 4, 'Leverstr.', 30, 'Walltrop', '45731');

-- SQLINES DEMO *** arzt_has_patient
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt_has_patient VALUES (2, 1, 'Diabetes', '2022-11-18 15:30:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt_has_patient VALUES (3, 4, 'Knötchen', '2022-11-22 11:00:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt_has_patient VALUES (3, 2, 'Eiterpusteln', '2022-12-02 15:00:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt_has_patient VALUES (1, 3, 'Inkontinenz', '2022-12-29 08:30:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt_has_patient VALUES (5, 1, 'COPD', '2022-11-23 12:00:00');
-- SQLINES LICENSE FOR EVALUATION USE ONLY
INSERT INTO arzt_has_patient VALUES (4, 3, 'Demenz', '2022-12-11 10:00:00');
