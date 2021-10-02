SELECT s.name
FROM Students AS s
INNER JOIN Friends as f ON s.id = f.id
INNER JOIN Packages as student_package ON s.id = student_package.id
INNER JOIN Packages as friend_package ON f.friend_id = friend_package.id
-- best friend got higher salary than them
WHERE friend_package.salary > student_package.salary
ORDER BY friend_package.salary;