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
where userid=1011;

-- 04. 이메일이 있는 사람을 조회하시오
select name as 이름,
    email as 이메일
from userdb
where email is not null;

-- 05. 주문내역을 보이시오
select *
from orders;

-- 06. 쇼핑몰의 총 매출을 보이시오
select sum(total_pirce) as "총매출(원)"
from orders;

-- 07. 회원번호 1001번의 주문내역을 보이시오
select *
from orders
where userdb_userid=1001;

-- 08. 1월달의 주문내역을 보이시오
select *
from orders
where extract(month from orderdate)=1;

-- 09. 1월 12일의 주문내역을 보이시오
select *
from orders
where extract(month from orderdate)=1
and extract(day from orderdate)=12;

-- 10. 서울에 사는 사람이 어떤 카테고리에서 무엇을 샀는지 검색하시오.
select u.name as 이름,
    c.categoryname as 카테고리명,
    g.goods_name as 상품명,
    o.total_price/g.goods_price as "상품개수",
    o.total_price as "총 가격"
from userdb u, goodsdb g, orders o, category c
where o.userdb_userid=u.userid
and o.goodsdb_goodsid=g.goodsid
and g.category_categoryid=c.categoryid;

-- 11. 카테고리 별로 상품이 몇 개있는지 보이시오
select categoryid as 카테고리번호,
    categoryname as 카테고리이름,
    count(*) as 종류
from category c, goodsdb g
where g.category_categoryid=c.categoryid
group by categoryid, categoryname
order by categoryid;

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
where goods_price>=40000;

-- 13. 가격이 30000원 이상 40000원 이하인 상품을 오름차순으로 검색하세요.
select goods_name as 상품명,
    goods_price as 가격
from goodsdb
where goods_price between 30000 and 40000
order by goods_price;

-- 14. 강아지 사료와 고양이 사료를 검색하시오.
select *
from goodsdb g
where g.category_categoryid in (
    select categoryid
    from category
    where categoryname in ('강아지 사료', '고양이 사료')
);

-- 15. 강아지 사료 중 2kg인 사료를 검색하시오.
select categoryname as 카테고리명,
    goods_name as 상품명,
    goods_price as 가격
from goodsdb g, category c
where g.goods_name like '%2kg%'
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
    from review);
    
--18. 가장 많이 판매된 상품부터 출력하세요.
select g.goods_name as 이름, o.total_price/g.goods_price as 개수
from orders o join goodsdb g on o.goodsdb_goodsid=g.goodsid
order by (o.total_price/g.goods_price) desc;

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
    order by sum(o.total_price) desc)
where rownum<=3
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
    order by daily_total desc)
where ROWNUM=1;

-- 32. 가장 많은 상품이 담긴 장바구니를 조회하시오.
select userdb_userid, cnt
from (select userdb_userid, sum(goodscnt) cnt
      from basket
      group by userdb_userid)
where cnt=(select max(total_goodscnt)
           from (select sum(goodscnt) total_goodscnt
                 from basket
                 group by userdb_userid)
);
    
-- 33. 가장 최근에 주문한 상품은?
select goods_name
from goodsdb
where goodsid=(select goodsdb_goodsid
                from (select goodsdb_goodsid
                       from orders
                       order by orderdate desc)
                where rownum=1);

-- 34. 가장 많은 리뷰가 달린 상품은 무엇인가요?
select goods_name
from goodsdb
where goodsid=(
    select goodsdb_goodsid
    from (
        select r.goodsdb_goodsid, count(*) as review_count
        from review r
        group by r.goodsdb_goodsid
        order by count(*) desc
    ) 
    where rownum=1
);

-- 35. 가장 많은 리뷰를 작성한 고객 조회
select name
from userdb
where userid=(
    select userdb_userid
    from (
        select userdb_userid, count(*)
        from review
        group by userdb_userid
        order by count(*) desc
    )
    where rownum = 1
);

-- 36. 각 카테고리 별로 카테고리에 속한 상품의 평균 가격을 조회하세요.
select categoryname as 카테고리이름,
    round(avg(goods_price),-1) as 평균가격
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
    select goodsdb_goodsid
    from (
        select goodsdb_goodsid, max(goods_price)
        from orders o1, goodsdb g1
        where o1.goodsdb_goodsid=g1.goodsid
        group by goodsdb_goodsid
        order by max(goods_price) desc
    )
    where rownum=1
);




