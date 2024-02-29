-----------------------
----- Dashboard 1 -----
-----------------------

-- Most Popular Shows by Genre --
SELECT genre, avg(tmdb_popularity) FROM Master
	WHERE release_year <= 2020
		AND show_type = 'TV SHOW'
	GROUP BY genre
	ORDER BY avg(tmdb_popularity) DESC
	LIMIT 11;

-- Most Popular Show Genre by Year (2010-2020) --
SELECT release_year, genre, count(DISTINCT show_id) FROM Master
	WHERE release_year BETWEEN 2010 AND 2020
		AND show_type = 'TV SHOW'
		AND genre IN ('romance', 'thriller', 'action', 'comedy', 'drama')
	GROUP BY release_year, genre;

	
-----------------------
----- Dashboard 2 -----
-----------------------

-- Most Popular Movie Genres in Prime Video --
SELECT genre, avg(tmdb_popularity) FROM Master
	WHERE release_year BETWEEN 2010 AND 2020
		AND show_type = 'MOVIE'
		AND provider = 'PrimeVideo'
		AND genre IN ('animation', 'scifi', 'fantasy', 'action', 'horror')
	GROUP BY genre
	ORDER BY avg(tmdb_popularity) DESC;

-- Prime Video Movie Count by Genre --
SELECT genre, count(DISTINCT show_id) FROM Master
	WHERE release_year BETWEEN 2010 AND 2020
		AND show_type = 'MOVIE'
		AND provider = 'PrimeVideo'
		AND genre IN ('animation', 'scifi', 'fantasy', 'action', 'horror')
	GROUP BY genre;
	
-- Time Series Trend in Prime Video Movies --
SELECT release_year, count(DISTINCT show_id) FROM Master
	WHERE release_year <= 2020
		AND show_type = 'MOVIE'
		AND provider = 'PrimeVideo'
		AND genre IN ('animation', 'scifi', 'fantasy', 'action', 'horror')
	GROUP BY release_year;

	
-----------------------
----- Dashboard 3 -----
-----------------------

-- Average Score of Movies and Shows by Provider --
SELECT provider, avg(tmdb_score) FROM Master
	GROUP BY provider;

-- Variety of Age Cert by Provider --	
SELECT age_certification, provider, count(age_certification) FROM Master
	GROUP BY age_certification, provider
	ORDER BY age_certification DESC;


-----------------------
----- Dashboard 4 -----
-----------------------

-- Average TMDB Score by Age Certification --
SELECT age_certification, avg(tmdb_score) FROM Master
	GROUP BY age_certification
	ORDER BY avg(tmdb_score) DESC;
	
-- Average Rating by Provider --
SELECT provider, avg(averageRating) FROM Master
	GROUP BY provider;