# Business Data Management [BDM]     
# Spring 2020    
# Homework Assignment #5: Final Assignment       
**Student Name:**  MD. FAZLAY RABBY     
**Student ID:**  18200610     

# Part 1: Identify key components of the data model (60 points).     

### 1) Entities and attributes        
* `arts: id, item_code, title, type, size`
* `artists: artist_id, name, date_of_birth, date_of_death`
* `artist_art: artist_id, art_id`
* `museums: id, location_in_museum`
* `traveling_shows: id, city, traveling_show_start_date, traveling_show_end_date`
* `another_galleries: id, name, city, loan_start_date, loan_end_date      `
* `art_presence: id, art_id, art_presence( 'display_at_the_museum', 'held_in_storage', 'traveling_show', 'loan_to_another_gallery' ), museum_id, traveling_show_id, another_gallery_id`

### 2) Identify relationships including the degree and cardinality of each relationship. 

a. **arts & artists** this relationship is a degree of 2 (binary). The cardinality is
Many-to-Many between `arts` & `artists`. One arts can belongs to a artist and artist can have multiple art work.
In some case, one cart could developed by list of artist. we use `artist_art` pivot table 

b. **art_presence, artists, museums, traveling_shows, another_galleries**: this relationship is a degree of N-ary (n degree). The cardinality is
(Mandatory)One-to-(Optional)One from arts to art_presence. Others cardinalities are (Optional)One-to-(Optional)One from `art_presence` to `museums`, `traveling_shows` & `another_galleries` .  

# Part 2: Create a [logical] database schema based on your answers in Part 1 using MySQL Workbench (40 points).   

<img src="pictures/eer_diagram.PNG" alt="">          

# Part 3: Develop a [physical] database on your MySQL server based on the database schema created in Part 2, and then insert data into each table. (50%)

#### `arts` Table
<img src="pictures/table/1.PNG" alt="">          

#### `artists` Table
<img src="pictures/table/2.PNG" alt="">          

#### `artist_art` Table
<img src="pictures/table/3.PNG" alt="">          

#### `museums` Table
<img src="pictures/table/4.PNG" alt="">          

#### `traveling_shows` Table
<img src="pictures/table/5.PNG" alt="">          

#### `another_galleries` Table
<img src="pictures/table/6.PNG" alt="">          

#### `art_presence` Table
<img src="pictures/table/7.PNG" alt="">          















