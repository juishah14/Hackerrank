-- need max score for each challenge done by a hacker
-- then sum these up

SELECT temp.hacker_id, h.name, SUM(temp.score) AS total_score
FROM
(
    SELECT hacker_id, challenge_id, MAX(score) AS score
    FROM Submissions
    GROUP BY hacker_id, challenge_id -- want max score for each challenge done by each hacker  
)
AS temp
INNER JOIN Hackers as h ON temp.hacker_id = h.hacker_id
GROUP BY temp.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, temp.hacker_id;