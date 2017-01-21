1. SELECT COUNT (politician_id) FROM votes WHERE politician_id = 524;
2. SELECT COUNT(politician_id) FROM votes JOIN congress_members
ON votes.politician_id = congress_members.id WHERE congress_members.name  = 'Sen. Olympia Snowen';
3. SELECT COUNT(politician_id) FROM votes
JOIN congress_members ON votes.politician_id = congress_members.id
WHERE congress_members.name  = 'Rep. Erik Paulsen';
4. SELECT name, party, location, grade_1996, grade_current,years_in_congress, dw1_score,
COUNT(politician_id) AS numbers_in_vote FROM congress_members, votes
WHERE congress_members.id = votes.politician_id
GROUP BY congress_members.id ORDER BY numbers_in_vote DESC LIMIT 3;
5. SELECT name, party, location, grade_1996, grade_current,years_in_congress, dw1_score,
COUNT(politician_id) AS numbers_in_vote FROM congress_members, votes
WHERE congress_members.id = votes.politician_id
GROUP BY congress_members.id ORDER BY numbers_in_vote ASC LIMIT 3;
