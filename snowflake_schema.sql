CREATE TABLE fact_trip(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
vendor_id INT,
pay_type INT,
distance REAL,
date_pick date,
pass_num INT,
total REAL
);

LOAD DATA INFILE 'new_york.csv' INTO TABLE fact_trip
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines
(@col1,@col2,@col3,@col4, @col5, @col6, @col7, @col8, @col9, @col10, @col11, @col12, @col13, @col14, @col15, @col16, @col17, @col18, @col19, @col20, @col21) 
set vendor_id =@col1, pass_num =@col4, distance =@col5, pay_type =@col10, total =@col17, date_pick =@col18;


CREATE TABLE location(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pu_loc INT
);

LOAD DATA INFILE 'new_york.csv' INTO TABLE location
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines
(@col1,@col2,@col3,@col4, @col5, @col6, @col7, @col8, @col9, @col10, @col11, @col12, @col13, @col14, @col15, @col16, @col17, @col18, @col19, @col20, @col21) 
set pu_loc =@col8;


CREATE TABLE lookup(
loc_id INT PRIMARY KEY,
borough TEXT,
zone TEXT, 
service_zone TEXT
);
 
LOAD DATA INFILE 'taxi_zone_lookup.csv' INTO TABLE lookup
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines
(@col1,@col2,@col3,@col4) 
set loc_id =@col1, borough =@col2, zone =@col3, service_zone =@col4;