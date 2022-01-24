USE booksbd
SELECT 
	CONCAT(firstname," ",surname) fio,
	COUNT(ab.book_id) books_count
FROM
	author_books ab
JOIN
	authors a USING(author_id)
GROUP BY
	ab.author_id
ORDER BY
	books_count
DESC
LIMIT 1;


