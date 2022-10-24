-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/JM9HIf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

create database carrot;
use carrot;

CREATE TABLE `User` (
    `userIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `location` text NOT NULL ,
    `nickname` varchar(45) NOT NULL ,
    `profileImg` text NOT NULL ,
    `phoneNum` varchar(45) NOT NULL ,
    `email` varchar(45) NULL ,
    `temperature` float NOT NULL ,
    `redealRate` float NOT NULL ,
    `responseRate` float NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Interest` (
    `interestIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `category` int NOT NULL ,
    `isSelected` boolean NOT NULL ,
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Badge` (
    `badgeIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `category` int NOT NULL ,
    `isActive` boolean NOT NULL ,
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Trade` (
    `tradeIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `title` varchar(45) NOT NULL ,
    `category` int NOT NULL ,
    `price` int NOT NULL ,
    `isSuggested` boolean NOT NULL ,
    `context` text NOT NULL ,
    `view` int NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TradeImg` (
    `tradeImgIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `tradeIdx` int NOT NULL ,
    `tradeImgUrl` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TradeChatRoom` (
    `chatRoomIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `firstUserIdx` int NOT NULL ,
    `secondUserIdx` int NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TradeChat` (
    `chatIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `chatRoomIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `context` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TradeReview` (
    `reviewIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `tradeIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `context` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TradeReviewImg` (
    `reviewImgIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `reviewIdx` int NOT NULL ,
    `tradeIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `boardImgUrl` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `MannerReview` (
    `mannerIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `category` int NOT NULL ,
    `isGood` boolean NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `TradeLike` (
    `tradeLikeIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `tradeIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `GroupPurchase` (
    `purchaseIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `title` varchar(45) NOT NULL ,
    `context` text NOT NULL ,
    `memberCnt` int NOT NULL ,
    `price` int NOT NULL ,
    `shareDay` varchar(45) NOT NULL ,
    `shareLocation` text NOT NULL ,
    `productLink` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `GroupPurchaseImg` (
    `purchaseImgIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `purchaseIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `purchaseImgUrl` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `GroupPurchaseMember` (
    `purchaseMemberIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `purchaseIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `GroupActivity` (
    `activityIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `category` int NOT NULL ,
    `title` varchar(45) NOT NULL ,
    `context` text NOT NULL ,
    `memberCnt` int NOT NULL ,
    `gender` int NOT NULL ,
    `age` int NOT NULL ,
    `date` varchar(45) NOT NULL ,
    `time` varchar(45) NOT NULL ,
    `location` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `GroupActivityMember` (
    `activityMemberIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `activityIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Board` (
    `boardIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `category` int NOT NULL ,
    `context` text NOT NULL ,
    `location` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `BoardImg` (
    `boardImgIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `boardIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `boardImgUrl` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `BoardComment` (
    `boardCommentIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `boardIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `context` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `BoardCommentLike` (
    `commentLikeIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `boardIdx` int NOT NULL ,
    `boardCommentIdx` int NOT NULL ,
    `userIdx` int NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `Notice` (
    `noticeIdx` int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `userIdx` int NOT NULL ,
    `title` varchar(45) NOT NULL ,
    `context` text NOT NULL ,
    `noticeImgUrl` text NOT NULL ,
    `status` varchar(45) NOT NULL DEFAULT 'ACTIVE',
    `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `Interest` ADD CONSTRAINT `fk_Interest_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `Badge` ADD CONSTRAINT `fk_Badge_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `Trade` ADD CONSTRAINT `fk_Trade_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `TradeImg` ADD CONSTRAINT `fk_TradeImg_tradeIdx` FOREIGN KEY(`tradeIdx`)
REFERENCES `Trade` (`tradeIdx`);

ALTER TABLE `TradeChatRoom` ADD CONSTRAINT `fk_TradeChatRoom_firstUserIdx` FOREIGN KEY(`firstUserIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `TradeChatRoom` ADD CONSTRAINT `fk_TradeChatRoom_secondUserIdx` FOREIGN KEY(`secondUserIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `TradeChat` ADD CONSTRAINT `fk_TradeChat_chatRoomIdx` FOREIGN KEY(`chatRoomIdx`)
REFERENCES `TradeChatRoom` (`chatRoomIdx`);

ALTER TABLE `TradeChat` ADD CONSTRAINT `fk_TradeChat_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `TradeReview` ADD CONSTRAINT `fk_TradeReview_tradeIdx` FOREIGN KEY(`tradeIdx`)
REFERENCES `Trade` (`tradeIdx`);

ALTER TABLE `TradeReviewImg` ADD CONSTRAINT `fk_TradeReviewImg_reviewIdx` FOREIGN KEY(`reviewIdx`)
REFERENCES `TradeReview` (`reviewIdx`);

ALTER TABLE `TradeReviewImg` ADD CONSTRAINT `fk_TradeReviewImg_tradeIdx` FOREIGN KEY(`tradeIdx`)
REFERENCES `Trade` (`tradeIdx`);

ALTER TABLE `TradeReviewImg` ADD CONSTRAINT `fk_TradeReview_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `MannerReview` ADD CONSTRAINT `fk_MannerReview_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `TradeLike` ADD CONSTRAINT `fk_TradeLike_tradeIdx` FOREIGN KEY(`tradeIdx`)
REFERENCES `Trade` (`tradeIdx`);

ALTER TABLE `TradeLike` ADD CONSTRAINT `fk_TradeLike_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `GroupPurchase` ADD CONSTRAINT `fk_GroupPurchase_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `GroupPurchaseImg` ADD CONSTRAINT `fk_GroupPurchaseImg_purchaseIdx` FOREIGN KEY(`purchaseIdx`)
REFERENCES `GroupPurchase` (`purchaseIdx`);

ALTER TABLE `GroupPurchaseImg` ADD CONSTRAINT `fk_GroupPurchaseImg_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `GroupPurchaseMember` ADD CONSTRAINT `fk_GroupPurchaseMember_purchaseIdx` FOREIGN KEY(`purchaseIdx`)
REFERENCES `GroupPurchase` (`purchaseIdx`);

ALTER TABLE `GroupPurchaseMember` ADD CONSTRAINT `fk_GroupPurchaseMember_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `GroupActivity` ADD CONSTRAINT `fk_GroupActivity_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `GroupActivityMember` ADD CONSTRAINT `fk_GroupActivityMember_activityIdx` FOREIGN KEY(`activityIdx`)
REFERENCES `GroupActivity` (`activityIdx`);

ALTER TABLE `GroupActivityMember` ADD CONSTRAINT `fk_GroupActivityMember_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `Board` ADD CONSTRAINT `fk_Board_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `BoardImg` ADD CONSTRAINT `fk_BoardImg_boardIdx` FOREIGN KEY(`boardIdx`)
REFERENCES `Board` (`boardIdx`);

ALTER TABLE `BoardImg` ADD CONSTRAINT `fk_BoardImg_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `BoardComment` ADD CONSTRAINT `fk_BoardComment_boardIdx` FOREIGN KEY(`boardIdx`)
REFERENCES `Board` (`boardIdx`);

ALTER TABLE `BoardComment` ADD CONSTRAINT `fk_BoardComment_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `BoardCommentLike` ADD CONSTRAINT `fk_BoardCommentLike_boardIdx` FOREIGN KEY(`boardIdx`)
REFERENCES `Board` (`boardIdx`);

ALTER TABLE `BoardCommentLike` ADD CONSTRAINT `fk_BoardCommentLike_boardCommentIdx` FOREIGN KEY(`boardCommentIdx`)
REFERENCES `BoardComment` (`boardCommentIdx`);

ALTER TABLE `BoardCommentLike` ADD CONSTRAINT `fk_BoardCommentLike_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);

ALTER TABLE `Notice` ADD CONSTRAINT `fk_Notice_userIdx` FOREIGN KEY(`userIdx`)
REFERENCES `User` (`userIdx`);
