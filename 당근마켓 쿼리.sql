show databases;
use carrot;

show tables;

# 스탠다드 미션 쿼리

# 회원가입 쿼리
insert into User values (null, '관악구 봉천동', '당근당근', 'profile_url', '010-2449-2187', null, 36.5, 0, 0, default, default, default);

# 프로필 정보 쿼리
select user.userIdx, user.nickname, user.profileImg, user.temperature, user.redealRate, user.responseRate,
     count(interest.interestIdx) as interestCnt,
     count(trade.tradeIdx) as tradeCnt
from User as user
left outer join Interest as interest on user.userIdx=interest.userIdx
    and interest.status='ACTIVE'
left outer join Trade as trade on user.userIdx=trade.userIdx
    and (trade.status='ACTIVE' or trade.status='DONE')
where user.userIdx=1
      and interest.status='ACTIVE'
      and (trade.status='ACTIVE' or trade.status='DONE');

# 닉네임 수정 쿼리
update User set nickname='조은수정', updatedAt=current_timestamp where userIdx=1;

# 관심사 선택 쿼리
# alter table Interest modify isSelected varchar(45) not null default 'ACTIVE';
# alter table Interest rename column isSelected to status;
insert into Interest values (null, 3, 3, default, default, default);

# 관심사 선택 해제 쿼리
update Interest set status='INACTIVE', updatedAt=current_timestamp where userIdx=1 and category=5;

# 관심사 불러오기 쿼리
select interestIdx, userIdx, category, status from Interest where userIdx=1 and status='ACTIVE';

# timezone 변경 - 실패
select current_timestamp;
select @@system_time_zone;
set time_zone='Asia/Seoul';
select current_timestamp;
SHOW GLOBAL VARIABLES LIKE '%zone%';

# 중고 거래 글 올리기 쿼리
insert into Trade values (null, 1, '이불 팝니다 ^_^', 1, 10000, true, '보송보송한 이불 팔아요', 0, default, default, default);
# insert into Trade values (null, 1, '초콜렛 팔아요', 5, 500, true, '맛있는 킨더 초콜렛', 0, default, default, default);
# insert into Trade values (null, 3, '사탕 팔아요', 5, 300, true, '맛있는 츄파츕스', 0, default, default, default);

# 중고 거래 사진 올리기 쿼리
insert into TradeImg values (null, 1, '이불 사진 링크', default, default, default);
# insert into TradeImg values (null, 1, '이불 사진 링크2', default, default, default);
# insert into TradeImg values (null, 2, '초콜렛 사진 링크', default, default, default);
# insert into TradeImg values (null, 4, '사탕 사진 링크', default, default, default);

# 중고 거래 완료 상태 쿼리
update Trade set status='DONE', updatedAt=current_timestamp where tradeIdx=1;

# 중고 거래 글 좋아요
insert into TradeLike values(null, 1, 1, default, default, default);
# insert into TradeLike values(null, 4, 3, default, default, default);

# 중고 거래 글 좋아요 취소
update TradeLike set status='INACTIVE', updatedAt=current_timestamp where tradeLikeIdx=1;

# 활동 알림 리스트 쿼리
select noticeIdx, userIdx, title, context, noticeImgUrl, status,
    case
        when timestampdiff(minute, createdAt, now()) <= 0 THEN concat(timestampdiff(second, createdAt, now()), '초 전')
        when timestampdiff(minute, createdAt, now()) < 60 THEN concat(timestampdiff(minute, createdAt, now()), '분 전')
        when timestampdiff(hour, createdAt, now()) < 24 THEN concat(timestampdiff(hour, createdAt, now()), '시간 전')
        when timestampdiff(day, createdAt, now()) < 7 THEN concat(timestampdiff(day, createdAt, now()), '일 전')
        when timestampdiff(day, createdAt, now()) < 30 THEN concat(timestampdiff(week, createdAt, now()), '주 전')
        else concat(timestampdiff(month, createdAt, now()), '개월 전')
        end as createdAt
from Notice
where userIdx=1;