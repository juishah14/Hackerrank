SELECT IF(GRADES.GRADE < 8, NULL, STUDENTS.NAME), GRADES.GRADE, STUDENTS.MARKS
FROM STUDENTS 
INNER JOIN GRADES ON STUDENTS.MARKS BETWEEN GRADES.MIN_MARK AND GRADES.MAX_MARK -- grade they get depends on the student's marks
ORDER BY GRADES.GRADE DESC, STUDENTS.NAME, STUDENTS.MARKS;