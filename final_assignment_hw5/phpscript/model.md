arts
====
id
item_code
title
type
size

art_presence
============ 
id
art_id
art_presence enum( 'display_at_the_museum', 'held_in_storage', 'traveling_show', 'loan_to_another_gallery' )
museum_information_id
traveling_show_id
another_gallery_id

museums
================
id
location_in_museum

traveling_shows
================
id
city
traveling_show_start_date
traveling_show_end_date


another_galleries
================
id
name
city
loan_start_date
loan_end_date


artists
=======
artist_id
name
date_of_birth
date_of_death

artist_art
==========
id
artist_id
art_id






