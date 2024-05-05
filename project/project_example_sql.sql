-- 01. 고객 정보를 보이시오(이름 / 이메일 / 닉네임 / 전화번호).
select name as 이름,
    email as 이메일,
    nick_name as 닉네임,
    phone as 전화번호
from userdb;

-- 02. 회원 가입을 해보세요.
select *
from userdb;

insert into userdb values(1011, 'huhumm10', '123123', '뉴휴먼', 'huhumm10@naver.com', '새로운사람', '010-7878-7979');

-- 03. 회원 탈퇴를 해보세요.
select *
from userdb;

delete userdb
where userid=1011; -- 회원번호 1011번

-- 04. 이메일이 있는 사람을 조회하시오
select name as 이름,
    email as 이메일
from userdb
where email is not null; -- 이메일이 null이 아닌 사람

-- 05. 주문내역을 보이시오
select *
from orders;

-- 06. 쇼핑몰의 총 매출을 보이시오
select sum(total_pirce) as "총매출(원)" -- 집계함수
from orders;

-- 07. 회원번호 1001번의 주문내역을 보이시오
select *
from orders
where userdb_userid=1001; -- 회원번호가 1001번

-- 08. 1월달의 주문내역을 보이시오
select *
from orders
where extract(month from orderdate)=1; -- 값이 1월인 값을 추출

-- 09. 1월 12일의 주문내역을 보이시오
select *
from orders
where extract(month from orderdate)=1 -- 값이 1월인 값을 추출
and extract(day from orderdate)=12; -- 값이 12일인 값을 추출

-- 10. 서울에 사는 사람이 어떤 카테고리에서 무엇을 샀는지 검색하시오.
select u.name as 이름,
    c.categoryname as 카테고리명,
    g.goods_name as 상품명,
    o.total_price/g.goods_price as "상품개수",
    o.total_price as "총 가격"
from userdb u, goodsdb g, orders o, category c
where o.userdb_userid=u.userid      -- orders테이블에 userdb테이블을 조인
and o.goodsdb_goodsid=g.goodsid     -- orders테이블에 goodsdb테이블을 조인
and g.category_categoryid=c.categoryid; -- goodsdb테이블에 category테이블을 조인

-- 11. 카테고리 별로 상품이 몇 개있는지 보이시오
select categoryid as 카테고리번호,
    categoryname as 카테고리이름,
    count(*) as 종류
from category c, goodsdb g
where g.category_categoryid=c.categoryid    -- goodsdb테이블에 category테이블을 조인
group by categoryid, categoryname           -- 집계함수가 있기에 group으로 묶음
order by categoryid;                        -- categoryid로 오름차순

-- 12. 카테고리번호 22번에서 상품을 구매한 고객이 있는지, 무엇을 구매했는지 보이시오.
select u.userid as 회원번호,
    u.name as 이름,
    g.category_categoryid as 카테고리번호,
    g.goodsid as 상품번호,
    g.goods_name as 상품명,
    o.total_price/g.goods_price as 상품개수,
    o.total_price as 총가격
from orders o, userdb u, goodsdb g
where o.userdb_userid=u.userid
and g.goodsid=o.goodsdb_goodsid
and category_categoryid=22;

-- 12. 가격이 40000원 이상인 상품을 검색하세요.
select *
from goodsdb
where goods_price>=40000; --상품가격이 40000원이상

-- 13. 가격이 30000원 이상 40000원 이하인 상품을 오름차순으로 검색하세요.
select goods_name as 상품명,
    goods_price as 가격
from goodsdb
where goods_price between 30000 and 40000 --상품가격이 30000원이상 40000원이하
order by goods_price; -- 상품가격으로 오름차순 정리

-- 14. 강아지 사료와 고양이 사료를 검색하시오.
select *
from goodsdb g
where g.category_categoryid in (
    select categoryid
    from category
    where categoryname in ('강아지 사료', '고양이 사료')); -- 중첩질의

-- 15. 강아지 사료 중 2kg인 사료를 검색하시오.
select categoryname as 카테고리명,
    goods_name as 상품명,
    goods_price as 가격
from goodsdb g, category c
where g.goods_name like '%2kg%' -- 2kg이 포함된 것을 검색
and c.categoryid=g.category_categoryid
and categoryname in '강아지 사료';

-- 16. 고객이 주문한 상품의 총판매액, 평균값, 최저가, 최고가를 구하시오.
-- 단, 소수점은 정수로 반환하시오.
select sum(total_price) as 총판매액,
    round(avg(total_price)) as 평균값,
    min(total_price) as 최저가,
    max(total_price) as 최고가
from orders;

-- 17. 상품을 구매했으나 리뷰를 쓰지 않은 고객을 보이시오.
select name
from userdb
minus
select name
from userdb
where userid in (select userdb_userid
    from review); -- 중첩질의
    
--18. 가장 많이 판매된 상품부터 출력하세요.
select g.goods_name as 이름, o.total_price/g.goods_price as 개수
from orders o join goodsdb g on o.goodsdb_goodsid=g.goodsid
order by (o.total_price/g.goods_price) desc; -- 내림차순

-- 19. 성이 '김'씨인 고객을 검색하세요.
select *
from userdb
where name like '김%';

-- 20. 지역별 주문빈도를 검색하세요.
select substr(address,1,2) as 지역, count(*) as 주문수
from orders
group by substr(address,1,2)
order by count(*) desc;

-- 21. replace 를 이용해서 상품 가격이 7000원인 상품을 10%할인 금액으로 변경하세요.
select goodsid as 상품번호,
    goods_name as 상품명,
    replace(goods_price, 7000, 7000*0.9) as 가격
from goodsdb
where goods_price=7000;

-- 22. 이벤트가 열렸습니다. 강아지 사료를 30%할인하세요.
-- 단, 1원 단위는 반올림하세요.
select goodsid as 상품번호,
    goods_name as 상품명,
    goods_price as 가격,
    floor(goods_price*0.30*0.1)*10 as 할인금액,
    CEIL(goods_price*0.70*0.1)*10 as 할인된금액
from goodsdb g join category c on c.categoryid=g.category_categoryid
where categoryname like '강아지 사료';

-- 23. 날짜 별 주문수를 검색하세요.
select orderdate, count(*)
from orders
group by orderdate
order by orderdate;

-- 24. 주문 수가 많은 요일부터 차례대로 보이시오.
select to_char(orderdate, 'dy'), count(*)
from orders
group by to_char(orderdate, 'dy')
order by count(*) desc;

-- 25. 회원정보를 보이시오.
-- 단, 정보가 없는 경우 '(없음)'으로 표시하시오
select userid as 회원정보,
    name as 이름,
    nvl(email, '(없음)') as 이메일,
    nick_name as 닉네임,
    phone as 전화번호
from userdb;

-- 26. 회원가입을 하세요.
insert into userdb values (1011, 'jeng', 'jeng', '정처기', 'jeng@naver.com', '정처깆', '010-7878-4545');
select *
from userdb
where userid=1011;

-- 27. 회원가입한 아이디의 비밀번호를 1234로 변경하세요.
update userdb
set loginpw=1234
where userid=1011;
select *
from userdb
where userid=1011;

-- 28. 리뷰가 있는 상품명과 리뷰내용, 리뷰댓글으르 보이시오.
select goods_name as 상품명,
    title as 리뷰제목,
    r_contents as 리뷰내용,
    nick_name as 닉네임,
    c.r_comment as 댓글
from review r, review_comment c, userdb u, goodsdb g
where r.review_id=c.review_review_id
and c.userdb_userid=u.userid
and g.goodsid=r.goodsdb_goodsid;

-- 29. 이벤트 중입니다. 2월달에 제일 많은 금액을 쓴 고객 3분에게 상품을 드리려고 합니다.
-- 1등 2등 3등을 검색하고, 각각 총 사용금액을 보이시오.
select rownum as 등수,
    name as 이름,
    total as 총사용금액 
from (select name, sum(o.total_price) total
    from userdb u join orders o on u.userid=o.userdb_userid
    where orderdate between '20240101' and '20240131'
    group by name
    order by sum(o.total_price) desc) -- 인라인뷰
where rownum<=3 -- 순차적으로 나오는 값을 3개까지만 보여줌
order by rownum;

-- 30. 유저정보에 성별을 추가하시오.
-- 단, 관리자는 성별이 없다.
select *
from userdb;

alter table userdb add sex varchar(3) null;
update userdb
set sex='여'
where name not in ('관리자','수정모','김철수','안영준','백두산','고민혁','정처기');
update userdb
set sex='남'
where sex is null
and name not like '관리자';

-- 31. 일일 매출액이 제일 큰 날짜와 총금액을 검색하시오.
select orderdate, daily_total
from (select orderdate, sum(total_price) as daily_total
    from orders
    group by orderdate
    order by daily_total desc) -- 바로 rownum를 사용하면 rownum가 실행되고 내림차순으로 정리되기에 from절에서 먼저 내림차순으로 정리 후 rownum 실행
where ROWNUM=1;

-- 32. 가장 많은 상품이 담긴 장바구니를 조회하시오.
select userdb_userid, cnt -- 3. A를 가지고 있는 회원번호를 찾아옴
from (select userdb_userid, sum(goodscnt) cnt
      from basket
      group by userdb_userid) -- 1. 유저 아이디별 장바구니 상품 개수
where cnt=(select max(total_goodscnt)
           from (select sum(goodscnt) total_goodscnt
                 from basket
                 group by userdb_userid) -- 2. 장바구니 상품 개수가 제일 많은 것을 검색 = A
);
    
-- 33. 가장 최근에 주문한 상품은?
select goods_name -- 3. 현재 상품번호를 가지고 있는 상품명을 반환
from goodsdb
where goodsid=(select goodsdb_goodsid -- 2. 순서대로 정렬된 것 중에서 rownum만큼 상품번호를 반환 = 현재 상품번호
                from (select goodsdb_goodsid --1. orders테이블에서 날짜 내림차순으로 정렬
                       from orders
                       order by orderdate desc)
                where rownum=1);

-- 34. 가장 많은 리뷰가 달린 상품은 무엇인가요?
select goods_name --3. 현재 상품번호를 가지고 있는 상품명을 반환
from goodsdb
where goodsid=(
    select goodsdb_goodsid -- 2. 순서대로 정렬된 것 중에서 rownum만큼 상품번호를 반환 = 현재 상품번호
    from (
        select r.goodsdb_goodsid, count(*) as review_count -- 1. 상품번호와 그 상품번호의 리뷰 개수를 내림차순으로 반환
        from review r
        group by r.goodsdb_goodsid
        order by count(*) desc
    ) 
    where rownum=1
);

-- 35. 가장 많은 리뷰를 작성한 고객 조회
select name -- 3. 현재 회원번호를 가지고 있는 이름 반환
from userdb
where userid=(
    select userdb_userid -- 2. 순서대로 정렬된 것 중에서 rownum만큼 회원번호를 반환 = 현재 회원번호
    from (
        select userdb_userid, count(*) -- 1. 회원번호와 리뷰 개수를 내림차순으로 정렬하고 반환
        from review
        group by userdb_userid
        order by count(*) desc
    )
    where rownum = 1
);

-- 36. 각 카테고리 별로 카테고리에 속한 상품의 평균 가격을 조회하세요.
select categoryname as 카테고리이름,
    round(avg(goods_price),-1) as 평균가격 -- round 함수 -1: 1의자리 반올림
from category c, goodsdb g
where c.categoryid=g.category_categoryid
group by categoryname, categoryid
order by categoryid;

-- 37. 주문한 상품 중에서 가장 비싼 상품의 정보를 조회하세요.
-- 카테고리번호, 카테고리명, 상품번호, 상품명, 상품가격, 상품설명
select categoryid as 카테고리번호,
    categoryname as 카테고리명,
    goodsid as 상품번호,
    goods_name as 상품명,
    goods_price as 상품가격,
    goods_info as 상품설명
from category c,goodsdb g
where c.categoryid=g.category_categoryid
and g.goodsid=(
    select goodsdb_goodsid -- 2. 정렬된 것 중에서 rownum 만큼 상품번호를 반환
    from (
        select goodsdb_goodsid, goods_price -- 1. 주문한 것 중에서 상품번호와 상품가격을 내림차순으로 반환
        from orders o1, goodsdb g1
        where o1.goodsdb_goodsid=g1.goodsid
        order by goods_price desc
    )
    where rownum=1
);

-- 38. 3월에 주문한 상품의 상품번호, 상품이름, 주문한 사람 이름, 우편번호, 주소, 상세주소를 보여주는 d_orders뷰를 생성하시오.
create view d_orders
as select goodsid as 상품번호,
    goods_name as 상품이름,
    name as 이름,
    address_num as 우편번호,
    address as 주소,
    detail_address as 상세주소
from goodsdb g, orders o, userdb u
where g.goodsid=o.goodsdb_goodsid
and o.userdb_userid=u.userid;

-- 39. 생성한 뷰를 이용하여 주문된 상품의 이름과 주문한 사람 이름을 출력하는 sql문을 작성하시오.
select 상품이름, 이름
from d_orders;

-- 40. d_orders 뷰를 변경하고자 한다. 판매가격 속성을 추가하고 상세주소와 우편주소를 삭제하는 명령을 수행하시오.
create or replace view d_orders(goodsid , goods_name, name, address, total_price)
as select goodsid as 상품번호,
    goods_name as 상품이름,
    name as 이름,
    address as 주소,
    total_price as 판매가격
from goodsdb g, orders o, userdb u
where g.goodsid=o.goodsdb_goodsid
and o.userdb_userid=u.userid;

select *
from d_orders;

-- 41. 회원의 이름과 주문한 상품의 이름을 보이시오. (조인/스칼라 부속질의 사용)
select (select name 
    from userdb u 
    where o.userdb_userid=u.userid) as 회원이름,
    goods_name as 상품이름
from goodsdb g join orders o on g.goodsid=o.goodsdb_goodsid;

-- 42. 주소가 부산이고 리뷰를 쓴 사람의 이름을 보이시오. (조인/인라인 뷰/중첩질의/exists 사용)
select distinct name
from (select name
    from userdb u join orders o on u.userid=o.userdb_userid
    where address like '%부산%')
where exists (select userdb_userid
            from review r, userdb u1
            where r.userdb_userid=u1.userid);

-- 43. 전체 주문금액 평균보다 적게 주문한 회원의 이름을 보이시오.
select name
from userdb u 
join (select userdb_userid, sum(total_price) as tp
    from orders
    group by userdb_userid) uo 
on u.userid=uo.userdb_userid
where tp<(select avg(total_price) from orders);

-- 44. 서울에서 서울 전체 주문금액 평균보다 많이 주문한 회원의 이름을 보이시오.
select name
from userdb u
join (select userdb_userid, sum(total_price) as tp --1. 서울에 사는 회원의 회원번호와 주문금액총합을 검색
    from orders
    where address like '%서울%'
    group by userdb_userid) uo 
on u.userid=uo.userdb_userid
where tp>(select avg(total_price) from orders where address like '%서울%'); -- 서울에 사는 회원의 주문금액총합과 서울 전체 주문금액 평균을 비교

-- 45. 주문한 상품들 중 가장 많은 상품들이 속한 카테고리 이름을 보이시오.
select categoryname
from (select categoryname, count(categoryname) -- 2. 주문된 상품번호가 포함된 카테고리명과 주문된 상품 개수를 반환, 내림차순으로 정렬
    from goodsdb g
    join category c 
    on c.categoryid=g.category_categoryid
    where g.goodsid in (select goodsdb_goodsid
                    from orders) --1. 주문된 상품번호를 반환
    group by categoryname
    order by count(categoryname) desc)
where rownum=1; --3. rownum 만큼 반환

-- 46. 현재 문의페이지(inquiry_page)가 있지만 코멘트를 등록하는 테이블이 없습니다.
-- 새로운 테이블(IPcomment)을 만들고 모든 문의에 답을 하시오.
create table IPcomment ( -- 테이블 생성
    IP_comment_id number primary key,   -- 기본키 할당
    IP_comment clob not null,
    reg_date date not null,
    inquiry_page_inquiry_id number,
    FOREIGN KEY (inquiry_page_inquiry_id) references inquiry_page(inquiry_id)); -- 외래키 할당
alter table IPcomment modify inquiry_page_inquiry_id number not null; -- null을 넣을 수 없다 조건 넣음

insert into IPcomment values (1001, '현재 계획된 이벤트는 없습니다.', '20240105', 10101);
insert into IPcomment values (1002, '보통 주문일 기준 3일이내에 배송완료됩니다..', '20240218', 10102);
insert into IPcomment values (1003, '아직 입고계획이 없습니다.', '20240218', 10103);
insert into IPcomment values (1004, '먹어도 됩니다.', '20240222', 10104);
insert into IPcomment values (1005, '그럴 계획 없습니다.', '20240229', 10105);
insert into IPcomment values (1006, '등록된 이메일로 임시 비밀번호를 보냈습니다.', '20240503', 10106);

-- 47. 문의번호, 문의제목, 문의내용, 문의내용작성날짜, 문의코멘트, 문의코멘트작성날짜 를 나타내는 뷰(IPview)를 만드세요
create view IPview -- 뷰 생성
as select inquiry_id as 문의번호,
    title as 문의제목,
    i_contents as 문의내용,
    ip.reg_date as 문의내용작성날짜,
    ip_comment as 문의코멘트,
    ipc.reg_date as 문의코멘트작성날짜
from inquiry_page ip
join IPcomment ipc
on ip.inquiry_id=ipc.inquiry_page_inquiry_id;

select *
from IPview;

-- 48. 각 카테고리의 평균금액을 구하시오.
-- 단, 1원 단위는 버리십시오
select categoryname as 카테고리명,
    round(avg(goods_price)*0.1)*10 as 평균금액
from category c
join goodsdb g
on g.category_categoryid=c.categoryid
group by categoryname;

-- 49. 각 카테고리별로 가장 비싼 상품과 가격을 찾으세요.
select categoryname, goods_name, Maxprice
from category c
join (select category_categoryid, max(goods_price) as Maxprice -- 1. 카테고리번호와 번호별 가장 비싼 상품 가격 반환
    from goodsdb
    group by category_categoryid) g
on c.categoryid=g.category_categoryid
join goodsdb g2 on c.categoryid=g2.category_categoryid and g2.goods_price=Maxprice; -- 2. 상품DB를 조인(상품이름위해서)


-- 50. 각 회원이 주문한 상품 중에서 평균 가격을 넘는 상품의 수를 찾기
select userid, name, count(*)
from userdb u
join (select goods_price, total_price, userdb_userid, round(avg(goods_price)*0.1)*10 as AvgPrice -- 1. 상품가격, 주문금액, 회원번호, 상품가격평균을 반환을 userdb 테이블에 조인
    from orders o, goodsdb g
    where o.goodsdb_goodsid=g.goodsid
    group by goods_price,total_price, userdb_userid) og
on u.userid=og.userdb_userid
where total_price/goods_price*total_price > AvgPrice -- 2. 주문한 상품 가격과 상품가격평균을 비교
group by userid,name;
