-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia -- 
SELECT S.`*` AS `Student` 
FROM `degrees` D
JOIN `students` S
ON D .`id` = S.`degree_id`
WHERE D.`name` = 'Corso di Laurea in Economia';

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze --
SELECT *  AS  `Degree`
FROM `degrees` D
JOIN `departments` C
ON C.`id`= D.`department_id`
WHERE C.`name` = 'Dipartimento di Neuroscienze';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) --
SELECT C.`name` AS `Course Name` 
FROM `teachers` T
JOIN `course_teacher` O
ON T.`id` = O.`teacher_id`
JOIN `courses` C
ON C.`id` =O .`course_id`  
WHERE T.`id`= 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il --
-- relativo dipartimento, in ordine alfabetico per cognome e nome --
SELECT S.`name`AS `Student's Name`, S.`surname` AS `Student's Surname`, D . `name`, D .`address`, D . `website`, O .`name`
FROM `students` S
JOIN `degrees` D
ON D.`id`  = S.`degree_id`
JOIN `departments` O
ON O.`id` = D .`department_id`;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti --
SELECT D . `name` AS `Degree`, C . `name` AS `Course`, T . `name` AS `Teacher's name`, T . `surname` AS `Teacher's Surname`
FROM `degrees` D
JOIN `courses`C
ON D.`id` = C . `degree_id`
JOIN `course_teacher` O
ON C . `id` = O . `course_id`
JOIN `teachers` T
ON T . `id` = O . `teacher_id`;

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica  --

SELECT `teachers`.`name` AS `Teacher's Name`, `teachers`.`surname` AS `Teacher's Surname` 
FROM `departments`
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
ON `degrees`. `id` = `courses`. `degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `teachers` . `id` = `course_teacher` . `teacher_id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';

-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami --

SELECT COUNT(`students`.`registration_number`) AS `number of times`, `students`.`registration_number` AS `badge number`, `courses` . `name` AS`Course Name`
FROM `students`
JOIN `exam_student`
ON `students` . `id` = `exam_student`. `student_id`
JOIN `exams`
ON `exams` .`id` = `exam_student`. `exam_id`
JOIN `courses`
ON `courses`. `id` = `exams`.`course_id`
GROUP BY `exams`.`course_id`, `badge number`;