# 1) List titles and types of artworks that were developed by ‘John Smith’.

select arts.title as title, arts.type as type
from artist_art
join artists on artists.id = artist_art.artist_id
join arts on arts.id = artist_art.art_id
where artists.name = 'John Smith';


# 2) List titles and types of artworks that were developed by ‘John Smith’ and participated in a show held in ‘Seoul’.

select arts.title as title, arts.type as type
from artist_art
join artists on artists.id = artist_art.artist_id
join arts on arts.id = artist_art.art_id
join art_presence on art_presence.art_id = artist_art.art_id
join traveling_shows on traveling_shows.id = art_presence.traveling_show_id
where ( 
  artists.name = 'John Smith' and 
  traveling_shows.city = 'Seoul'
);

# 3) List artwork names and names of galleries where artworks developed by ‘John Smith’ are loaned.

select arts.title as artwork_name, another_galleries.name as gallery_name
from artist_art
join artists on artists.id = artist_art.artist_id
join arts on arts.id = artist_art.art_id
join art_presence on art_presence.art_id = artist_art.art_id
join another_galleries on another_galleries.id = art_presence.another_gallery_id
where  
artists.name = 'John Smith';

# 4) Count the number of artworks developed by ‘John Smith’. (Note: use COUNT() to count rows.)

select artists.name as artist_name, count(artists.name) as number_of_art_work
from artist_art
join artists on artists.id = artist_art.artist_id
join arts on arts.id = artist_art.art_id
where artists.name = 'John Smith'
GROUP BY 1;

# 5) List artist names and the number of artworks developed by each artist.

select artists.name as artist_name, count(*) as number_of_art_work
from artist_art
join artists on artists.id = artist_art.artist_id
join arts on arts.id = artist_art.art_id
GROUP BY 1;

# 6) Create your own query that involves the table(s) transformed from the entity or entities that you added in Part 1 and other table(s).
# Here I have showing art title, art type, artist name and art presence using select statement

select
  arts.title as art_title,
  arts.type as art_type,
  artists.name as artist_name,
  art_presence.art_presence as art_presence
from artist_art
left join artists on artists.id = artist_art.artist_id
left join arts on arts.id = artist_art.art_id
left join art_presence on art_presence.art_id = artist_art.art_id
limit 10;
