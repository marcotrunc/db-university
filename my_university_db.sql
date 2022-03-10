-- Selezionare tutti gli studenti nati nel 1990 (160) --
SELECT * 
FROM `students` 
WHERE YEAR(`date_of_birth`) = '1990';

-- Selezionare tutti i corsi che valgono più di 10 crediti (479) --
SELECT * 
FROM `courses` 
WHERE `cfu` >'10';

-- Selezionare tutti gli studenti che hanno più di 30 anni --
SELECT *, TIMESTAMPDIFF(YEAR, `date_of_birth`,NOW()) AS `age` 
FROM `students`
WHERE  TIMESTAMPDIFF(YEAR, `date_of_birth`,NOW()) > 30;

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286) --
SELECT * 
FROM `courses` 
WHERE `period` = 'I semestre' 
AND `year` = 1;

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21) --
SELECT * 
FROM `exams` 
WHERE (HOUR(`hour`) >= 14) 
AND `date` = '2020-06-20';

-- Selezionare tutti i corsi di laurea magistrale (38) --
SELECT * 
FROM `degrees` 
WHERE `level` = 'magistrale';

-- Da quanti dipartimenti è composta l'università? (12) -- 
SELECT COUNT(`id`) AS `num_dipartimenti`
FROM `departments`;

-- Quanti sono gli insegnanti che non hanno un numero di telefono? (50) --
SELECT COUNT(*) AS `teachers_with_phone`
FROM `teachers` 
WHERE `phone` IS NULL;

--! ----------------------------------------------------------------------------------------------------
--! GROUP BY --
--! ----------------------------------------------------------------------------------------------------

-- Contare quanti iscritti ci sono stati ogni anno --
SELECT COUNT(*), YEAR(`enrolment_date`) AS `new_students` 
FROM `students` 
GROUP BY `new_students`;

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio --
SELECT COUNT(*) AS `insegnanti_coinquilini`, `office_address`
FROM `teachers` 
GROUP BY `office_address`;
--HAVING `insegnanti_coinquilini` AS `insegnanti_coinquilini` // e' come WHERE ma si può usare dopo GROUP BY

-- Calcolare la media dei voti di ogni appello d'esame -- 
SELECT ROUND(AVG(`vote`)) AS `media_voti`, `exam_id` AS `appello`
FROM `exam_student` 
GROUP BY `appello`;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento -- 
SELECT COUNT(*) AS `numero_corsi_laurea`, `department_id` 
FROM `degrees` 
GROUP BY `department_id`;