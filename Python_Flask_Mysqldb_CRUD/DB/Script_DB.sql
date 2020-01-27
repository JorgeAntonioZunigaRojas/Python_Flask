CREATE schema flaskdb;
use flaskdb;

CREATE TABLE computer (
id smallint unsigned not null auto_increment, 
data varchar(20) not null, 
primary key (id)
);
