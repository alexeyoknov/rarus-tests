USE booksbd
SELECT
	b.book_name, fio.names
FROM
	books b
JOIN 
	genres_book g USING(book_id)
JOIN 
	(
  	  SELECT
		  ab.book_id,
		  GROUP_CONCAT(firstname," ",surname ORDER BY surname SEPARATOR ', ' ) names
	  FROM
		  authors a
	  JOIN
		  author_books ab USING(author_id)
	  GROUP BY
		  ab.book_id
	) fio USING(book_id)	
WHERE
	g.genre_id = 1;
