SELECT  "writerRecipient".*, testimonials.message FROM 
	(SELECT "writerColumn".id, "writerColumn".writer, "recipientColumn".recipient FROM 
		(SELECT testimonials.id AS id, users.name AS writer FROM testimonials JOIN users ON users.id = testimonials."writerId") AS "writerColumn" 
	inner JOIN 
		(SELECT testimonials.id AS id, users.name AS recipient FROM testimonials JOIN users ON users.id = testimonials."recipientId") AS "recipientColumn" ON
		"writerColumn".id = "recipientColumn".id) AS "writerRecipient"
JOIN testimonials ON "writerRecipient".id = testimonials.id
ORDER BY testimonials.id