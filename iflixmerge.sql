drop table if exists Master;
create table Master (
  provider_id integer,
  provider text,
  show_id integer,
  title text,
  show_type text,
  release_year integer,
  age_certification text,
  runtime integer,
  seasons integer,
  tmdb_popularity real,
  tmdb_score real,
  genre_id integer,
  genre text,
  tconst text,
  averageRating real,	
  numVotes integer,
  PRIMARY KEY(provider_id, show_id, show_type, genre_id)
);

INSERT INTO Master SELECT ps.provider_id, provider, ps.show_id, title, ps.show_type, release_year, age_certification, runtime, seasons, 
							tmdb_popularity, tmdb_score, ps.genre_id, genre, il.tconst, averageRating, numVotes
	FROM ProviderShow_2NF ps
	LEFT JOIN Provider_2NF p
		ON ps.provider_id = p.provider_id
	LEFT JOIN genre_2NF g
		ON ps.genre_id = g.genre_id
	LEFT JOIN show_2NF s
		ON ps.show_id = s.show_id AND ps.show_type = s.show_type
	LEFT JOIN IMDbLookup_2NF il
		ON s.show_id = il.show_id AND s.show_type = il.show_type
	LEFT JOIN IMDbRating_2NF ir
		ON il.tconst = ir.tconst;
	