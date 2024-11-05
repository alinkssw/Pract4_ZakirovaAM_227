-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';
-- public.admission_patients определение

-- Drop table

-- DROP TABLE admission_patients;

CREATE TABLE admission_patients (
	id int4 NOT NULL,
	date_visit date NOT NULL,
	id_specialization int4 NOT NULL,
	id_patient int4 NOT NULL,
	cost_admission money NOT NULL,
	CONSTRAINT admission_patients_pk PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE admission_patients OWNER TO postgres;
GRANT ALL ON TABLE admission_patients TO postgres;


-- public.specialization определение

-- Drop table

-- DROP TABLE specialization;

CREATE TABLE specialization (
	id_specialization int4 NOT NULL,
	name_specialization varchar NOT NULL,
	CONSTRAINT specialization_pk PRIMARY KEY (id_specialization)
);

-- Permissions

ALTER TABLE specialization OWNER TO postgres;
GRANT ALL ON TABLE specialization TO postgres;


-- public.doctors определение

-- Drop table

-- DROP TABLE doctors;

CREATE TABLE doctors (
	id_doc int4 NOT NULL,
	name_doc varchar NOT NULL,
	surname_doc varchar NOT NULL,
	patronymic_doc varchar NULL,
	id_specialization int4 NOT NULL,
	CONSTRAINT doctors_pk PRIMARY KEY (id_doc),
	CONSTRAINT doctors_admission_patients_fk FOREIGN KEY (id_doc) REFERENCES admission_patients(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT doctors_specialization_fk FOREIGN KEY (id_specialization) REFERENCES specialization(id_specialization) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE doctors OWNER TO postgres;
GRANT ALL ON TABLE doctors TO postgres;


-- public.patient определение

-- Drop table

-- DROP TABLE patient;

CREATE TABLE patient (
	id_patient int4 NOT NULL,
	name_patient varchar NOT NULL,
	surname_patient varchar NOT NULL,
	patronymic_patient varchar NULL,
	birthday date NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT patient_pk PRIMARY KEY (id_patient),
	CONSTRAINT patient_admission_patients_fk FOREIGN KEY (id_patient) REFERENCES admission_patients(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE patient OWNER TO postgres;
GRANT ALL ON TABLE patient TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;

INSERT INTO public.admission_patients (id,date_visit,id_specialization,id_patient,cost_admission) VALUES
	 (1,'2024-11-01',1,1,3 000,00 ?),
	 (2,'2024-11-02',2,2,2 111,00 ?),
	 (3,'2024-11-03',3,3,2 400,00 ?),
	 (4,'2024-11-04',4,4,2 500,00 ?),
	 (5,'2024-11-05',5,5,5 000,00 ?),
	 (6,'2024-11-06',6,6,1 800,00 ?),
	 (7,'2024-11-07',7,7,3 000,00 ?),
	 (8,'2024-11-08',8,8,2 400,00 ?),
	 (9,'2024-11-09',9,9,2 100,00 ?),
	 (10,'2024-11-10',10,10,3 000,00 ?);
INSERT INTO public.doctors (id_doc,name_doc,surname_doc,patronymic_doc,id_specialization) VALUES
	 (1,'Ярослава','Шестова','Генадьевна',1),
	 (2,'Михаил','Михайлов','Владимирович',2),
	 (3,'Дмитрий','Родников','Дмитреевич',3),
	 (4,'Виталий','Филатов','Русланов',4),
	 (5,'Мирослава','Дьякова','Петровна',5),
	 (6,'Ксения','Азатова','Павловна',6),
	 (7,'Давид','Угрюмов','Александров',7),
	 (8,'Анастасия','Власова','Макаровна',8),
	 (9,'Анна','Крылова ','Алексеевна',9),
	 (10,'Максим','Маркин ','Максимович',10);
INSERT INTO public.patient (id_patient,name_patient,surname_patient,patronymic_patient,birthday,address) VALUES
	 (1,' Евгений ','Николаев ','Дмитриевич','2002-03-12','пл. Ладыгина, 41'),
	 (2,'Дария ','Алешина ',' Давидовна','1993-09-14','Ленина, 46'),
	 (3,' Пётр ','Лосев ','Гордеевич','1994-08-27','Будапештсткая, 36'),
	 (4,' Елизавета','Евдокимова',' Марковна','2009-08-22','Домодедовская, 25'),
	 (5,'Александра ','Дьяконова ','Львовна','1991-04-19',' Сталина, 55'),
	 (6,' Анастасия ','Никулина ','Дамировна','1999-11-12','Балканская, 67'),
	 (7,' Марк','Белов','Артёмович','2001-03-07','ул. Ломоносова, 82'),
	 (8,'Иван','Щеглов ',' Кириллович','2001-09-09','Ладыгина, 07'),
	 (9,' Ксения ','Быкова ','Тимофеевна','1992-03-14','Ломоносова, 71'),
	 (10,'Евгений ','Фролов','Петрович','2003-05-12','ул. Славы, 31');
INSERT INTO public.specialization (id_specialization,name_specialization) VALUES
	 (1,'терапевт'),
	 (2,'кардиолог'),
	 (3,'офтальмолог'),
	 (4,'кардиолог'),
	 (5,'терапевт'),
	 (6,'офтальмолог'),
	 (7,'хирург'),
	 (8,'хирург'),
	 (9,'терапевт'),
	 (10,'терапевт');

