show databases;
use carrot;

show tables;

# 챌린지 미션 쿼리

# 유저가 올린 중고 거래 리스트 불러오기 쿼리 (전체 상품)
select user.userIdx, user.nickname, user.location, title,
    (select tradeImgUrl FROM TradeImg
        WHERE tradeIdx = trade.tradeIdx
        LIMIT 1) as tradeImg,
    FORMAT(price, 0) as price, trade.status,
    case
    when timestampdiff(minute, trade.createdAt, now()) <= 0 THEN concat(timestampdiff(second, trade.createdAt, now()), '초 전')
    when timestampdiff(minute, trade.createdAt, now()) < 60 THEN concat(timestampdiff(minute, trade.createdAt, now()), '분 전')
    when timestampdiff(hour, trade.createdAt, now()) < 24 THEN concat(timestampdiff(hour, trade.createdAt, now()), '시간 전')
    when timestampdiff(day, trade.createdAt, now()) < 7 THEN concat(timestampdiff(day, trade.createdAt, now()), '일 전')
    when timestampdiff(day, trade.createdAt, now()) < 30 THEN concat(timestampdiff(week, trade.createdAt, now()), '주 전')
    else concat(timestampdiff(month, trade.createdAt, now()), '개월 전')
    end as createdAt
from Trade as trade
join User as user on trade.userIdx = user.userIdx
where user.userIdx=1
    and (trade.status='ACTIVE' or trade.status='DONE');

# 유저가 올린 중고 거래 리스트 불러오기 쿼리 (거래중인 상품)
select user.userIdx, user.nickname, user.location, title,
    (select tradeImgUrl FROM TradeImg
        WHERE tradeIdx = trade.tradeIdx
        LIMIT 1) as tradeImg,
    FORMAT(price, 0) as price, trade.status,
    case
    when timestampdiff(minute, trade.createdAt, now()) <= 0 THEN concat(timestampdiff(second, trade.createdAt, now()), '초 전')
    when timestampdiff(minute, trade.createdAt, now()) < 60 THEN concat(timestampdiff(minute, trade.createdAt, now()), '분 전')
    when timestampdiff(hour, trade.createdAt, now()) < 24 THEN concat(timestampdiff(hour, trade.createdAt, now()), '시간 전')
    when timestampdiff(day, trade.createdAt, now()) < 7 THEN concat(timestampdiff(day, trade.createdAt, now()), '일 전')
    when timestampdiff(day, trade.createdAt, now()) < 30 THEN concat(timestampdiff(week, trade.createdAt, now()), '주 전')
    else concat(timestampdiff(month, trade.createdAt, now()), '개월 전')
    end as createdAt
from Trade as trade
join User as user on trade.userIdx = user.userIdx
where user.userIdx=1
    and trade.status='ACTIVE';

# 유저가 올린 중고 거래 리스트 불러오기 쿼리 (거래완료된 상품)
select user.userIdx, user.nickname, user.location, title,
    (select tradeImgUrl FROM TradeImg
        WHERE tradeIdx = trade.tradeIdx
        LIMIT 1) as tradeImgUrl,
    FORMAT(price, 0) as price, trade.status,
    case
    when timestampdiff(minute, trade.createdAt, now()) <= 0 THEN concat(timestampdiff(second, trade.createdAt, now()), '초 전')
    when timestampdiff(minute, trade.createdAt, now()) < 60 THEN concat(timestampdiff(minute, trade.createdAt, now()), '분 전')
    when timestampdiff(hour, trade.createdAt, now()) < 24 THEN concat(timestampdiff(hour, trade.createdAt, now()), '시간 전')
    when timestampdiff(day, trade.createdAt, now()) < 7 THEN concat(timestampdiff(day, trade.createdAt, now()), '일 전')
    when timestampdiff(day, trade.createdAt, now()) < 30 THEN concat(timestampdiff(week, trade.createdAt, now()), '주 전')
    else concat(timestampdiff(month, trade.createdAt, now()), '개월 전')
    end as createdAt
from Trade as trade
join User as user on trade.userIdx = user.userIdx
where user.userIdx=1
    and trade.status='DONE';

# 유저가 올린 중고 거래 글 불러오기

# TradeChatRoom에 tradeIdx 속성 추가
alter table TradeChatRoom add tradeIdx int not null;
ALTER TABLE `TradeChatRoom` ADD CONSTRAINT `fk_TradeChatRoom_tradeIdx` FOREIGN KEY(`tradeIdx`)
REFERENCES `Trade` (`tradeIdx`);

select user.userIdx, user.profileImg, user.nickname, user.location, user.temperature,
     trade.tradeIdx, trade.title, trade.context, trade.view, trade.isSuggested,
     count(tradeLike.tradeLikeIdx) as likeCnt,
     count(chatRoom.chatRoomIdx) as chatCnt,
     case
        when timestampdiff(minute, trade.createdAt, now()) <= 0 THEN concat(timestampdiff(second, trade.createdAt, now()), '초 전')
        when timestampdiff(minute, trade.createdAt, now()) < 60 THEN concat(timestampdiff(minute, trade.createdAt, now()), '분 전')
        when timestampdiff(hour, trade.createdAt, now()) < 24 THEN concat(timestampdiff(hour, trade.createdAt, now()), '시간 전')
        when timestampdiff(day, trade.createdAt, now()) < 7 THEN concat(timestampdiff(day, trade.createdAt, now()), '일 전')
        when timestampdiff(day, trade.createdAt, now()) < 30 THEN concat(timestampdiff(week, trade.createdAt, now()), '주 전')
        else concat(timestampdiff(month, trade.createdAt, now()), '개월 전')
     end as createdAt
from Trade as trade
join User as user on trade.userIdx = user.userIdx
left outer join TradeLike as tradeLike on trade.tradeIdx = tradeLike.tradeIdx
    and tradeLike.status='ACTIVE'
left outer join TradeChatRoom as chatRoom on trade.tradeIdx = chatRoom.tradeIdx
    and chatRoom.status='ACTIVE'
where user.userIdx=3
    and trade.tradeIdx=4
    and trade.status!='INACTIVE';

# 받은 후기 리스트 불러오기

# 판매자, 구매자 여부 속성 추가
alter table TradeReview add isConsumer boolean not null;
#alter table TradeReviewImg rename column boardImgUrl to reviewImgUrl;

select review.reviewIdx, review.isConsumer, review.context,
    trade.userIdx as userIdx,
    user.userIdx as reviewerIdx, user.nickname, user.profileImg, user.location,
    (select min(reviewImgUrl) from TradeReviewImg) as reviewImg,
    case
        when timestampdiff(minute, review.createdAt, now()) <= 0 THEN concat(timestampdiff(second, review.createdAt, now()), '초 전')
        when timestampdiff(minute, review.createdAt, now()) < 60 THEN concat(timestampdiff(minute, review.createdAt, now()), '분 전')
        when timestampdiff(hour, review.createdAt, now()) < 24 THEN concat(timestampdiff(hour, review.createdAt, now()), '시간 전')
        when timestampdiff(day, review.createdAt, now()) < 7 THEN concat(timestampdiff(day, review.createdAt, now()), '일 전')
        when timestampdiff(day, review.createdAt, now()) < 30 THEN concat(timestampdiff(week, review.createdAt, now()), '주 전')
        else concat(timestampdiff(month, review.createdAt, now()), '개월 전')
    end as createdAt
from TradeReview as review
join User as user on review.userIdx=user.userIdx
    and user.status='ACTIVE'
join Trade as trade on review.tradeIdx = trade.tradeIdx
    and trade.status!='INACTIVE'
where trade.userIdx=1
    and review.status='ACTIVE';