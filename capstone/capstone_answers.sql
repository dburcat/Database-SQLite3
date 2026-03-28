-- Capstone Answers
-- Fill in each query below.

-- Q1: List every artist name and country, sorted alphabetically by name.
select * from artists order by name

-- Q2: How many albums are in the catalog?
select count(*) as total  from albums

-- Q3: Which genre has the most albums? (genre name and count)
select genre_id, count(*) from albums group by genre_id limit 1

-- Q4: Album titles released before 1970, with artist name.
select albums.title, albums.year_released, artists.name as artist from albums inner join artists on albums.artist_id = artists.id where albums.year_released < 1970 order by albums.year_released desc

-- Q5: Longest track — title, album title, duration as MM:SS.
select tracks.title, albums.title as album,substr(time(duration_sec, 'unixepoch'), 4, 5) as duration from tracks  inner join albums on tracks.album_id = albums.id order by duration_sec desc limit 1

-- Q6: Track count per album, sorted by count descending.
select albums.title as album, count(*) as track_count from tracks inner join albums on tracks.album_id = albums.id group by tracks.album_id order by track_count desc

-- Q7: Artists with more than one album.
select artists.name as artist, count(*) as album_count from albums inner join artists on albums.artist_id = artists.id group by albums.artist_id having count(*) > 1

-- Q8: Tracks longer than 5 minutes — track title, album title, artist name.
select tracks.title, albums.title as album, artists.name as artist, tracks.duration_sec from tracks inner join albums on tracks.album_id = albums.id inner join artists on albums.artist_id = artists.id where tracks.duration_sec > 300

-- Q9: Average track duration per genre (in seconds, rounded to 1 decimal).
select genres.name, round(avg(tracks.duration_sec),1) as avg_duration from tracks join  albums on tracks.album_id = albums.id join genres on albums.genre_id = genres.id group by albums.genre_id

-- Q10: Artist with the most total tracks — artist name and total count.


-- BONUS: Per-album summary (title, artist, genre, track count, total minutes).
