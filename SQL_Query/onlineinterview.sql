CREATE TABLE `answerchoice` (
`anid` int(20) NOT NULL,
`userid` int(20) NULL DEFAULT NULL,
`ratio` double NULL DEFAULT NULL,
PRIMARY KEY (`anid`) ,
INDEX `userid` (`userid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='InnoDB free: 28672 kB; (`userid`) REFER `onlineinterview/user`(`uid`)';

CREATE TABLE `answercontest` (
`aid` int(20) NULL DEFAULT NULL,
`answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`adiff` int(20) NULL DEFAULT NULL,
INDEX `aid` (`aid`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='InnoDB free: 28672 kB; (`aid`) REFER `onlineinterview/testcontest`(`cid`); (`aid';

CREATE TABLE `testchoice` (
`tid` int(20) NOT NULL,
`tdiff` int(20) NULL DEFAULT NULL,
`tcontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`tcorr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`ta` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`tb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`tc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`td` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`tid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `testcontest` (
`cid` int(20) NOT NULL,
`cquestion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`cid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci;

CREATE TABLE `user` (
`uid` int(20) NOT NULL,
`uname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`uid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
COMMENT='InnoDB free: 28672 kB; (`uid`) REFER `onlineinterview/answerchoice`(`userid`)';


ALTER TABLE `answerchoice` ADD CONSTRAINT `answerchoice_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`uid`);
ALTER TABLE `answercontest` ADD CONSTRAINT `answercontest_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `testcontest` (`cid`);
ALTER TABLE `answercontest` ADD CONSTRAINT `answercontest_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `answerchoice` (`anid`);
ALTER TABLE `user` ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `answerchoice` (`userid`);

