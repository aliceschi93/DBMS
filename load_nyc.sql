CREATE TABLE location(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
vendor_id INT,
distance REAL,
pu_loc INT,
do_loc INT
);

LOAD DATA INFILE 'new_york.csv' INTO TABLE location
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines
(@col1,@col2,@col3,@col4, @col5, @col6, @col7, @col8, @col9, @col10, @col11, @col12, @col13, @col14, @col15, @col16, @col17, @col18, @col19, @col20, @col21) 
set vendor_id=@col1, distance=@col5, pu_loc=@col8, do_loc=@col9;


CREATE TABLE payment(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
vendor_id int,
pass_num int,
pay_type INT,
fare REAL,
extra REAL,
tax REAL,
tip REAL,
tolls REAL,
surcharge REAL,
total REAL
);

LOAD DATA INFILE 'new_york.csv' INTO TABLE payment
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines
(@col1,@col2,@col3,@col4, @col5, @col6, @col7, @col8, @col9, @col10, @col11, @col12, @col13, @col14, @col15, @col16, @col17, @col18, @col19, @col20, @col21) 
set vendor_id=@col1, pass_num=@col4, pay_type =@col10, fare =@col11, extra =@col12, tax =@col13, 
tip =@col14, tolls =@col15, surcharge =@col16, total =@col17;


CREATE TABLE time_info(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
vendor_id int,
date_pick date,
time_pick time,
date_drop date,
time_drop time
);

LOAD DATA INFILE 'new_york.csv' INTO TABLE time_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 lines
(@col1,@col2,@col3,@col4, @col5, @col6, @col7, @col8, @col9, @col10, @col11, @col12, @col13, @col14, @col15, @col16, @col17, @col18, @col19, @col20, @col21) 
set vendor_id=@col1, date_pick =@col18, time_pick=@col19, date_drop=@col20, time_drop=@col21;
