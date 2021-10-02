/*
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
In other words, include students who did not have the same number of challenges as other students or whose count was equal to the maximum number of challenges created.
*/

SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS cnt 
FROM Hackers AS h 
INNER JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id, h.name 
HAVING cnt = 
-- selecting student who has max number of challenges
(
    SELECT COUNT(c1.challenge_id) 
    FROM Challenges AS c1 
    GROUP BY c1.hacker_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
) 
-- selecting student whose number of challenges is dif from all other students number of challenges
OR cnt NOT IN 
(
    SELECT COUNT(c2.challenge_id) 
    FROM Challenges AS c2 
    GROUP BY c2.hacker_id -- get the number of challenges by each student
    HAVING c2.hacker_id <> h.hacker_id -- get the number of challenges of all students except for the current student ie. if we are looking at student 1, get the number of challenges done by student 2, student 3, etc.
)
ORDER BY cnt DESC, h.hacker_id;