CREATE DATABASE IF NOT EXISTS bbs DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
use bbs;
DROP TABLE IF EXISTS user;
CREATE TABLE user 
( 
	userID 		 VARCHAR(20),
    userPassword VARCHAR(20),
    userName 	 VARCHAR(20),
    userGender 	 VARCHAR(20),
    userEmail 	 VARCHAR(50),
    PRIMARY KEY (userID)
);

INSERT INTO user VALUES ('pengsu', '1234', '펭수', '남성', 'pengsu@naver.com');

