SELECT h.hacker_id, h.name 
FROM Submissions AS s 
INNER JOIN Hackers AS h ON s.hacker_id = h.hacker_id
INNER JOIN Challenges AS c ON s.challenge_id = c.challenge_id
INNER JOIN Difficulty AS d ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, h.hacker_id;