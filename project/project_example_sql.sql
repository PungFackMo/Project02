-- 01. �� ������ ���̽ÿ�(�̸� / �̸��� / �г��� / ��ȭ��ȣ).
select name as �̸�,
    email as �̸���,
    nick_name as �г���,
    phone as ��ȭ��ȣ
from userdb;

-- 02. ȸ�� ������ �غ�����.
select *
from userdb;

insert into userdb values(1011, 'huhumm10', '123123', '���޸�', 'huhumm10@naver.com', '���ο���', '010-7878-7979');

-- 03. ȸ�� Ż�� �غ�����.
select *
from userdb;

delete userdb
where userid=1011;

-- 04. �̸����� �ִ� ����� ��ȸ�Ͻÿ�
select name as �̸�,
    email as �̸���
from userdb
where email is not null;

-- 05. �ֹ������� ���̽ÿ�
select *
from orders;

-- 06. ���θ��� �� ������ ���̽ÿ�
select sum(total_pirce) as "�Ѹ���(��)"
from orders;

-- 07. ȸ����ȣ 1001���� �ֹ������� ���̽ÿ�
select *
from orders
where userdb_userid=1001;

-- 08. 1������ �ֹ������� ���̽ÿ�
select *
from orders
where extract(month from orderdate)=1;

-- 09. 1�� 12���� �ֹ������� ���̽ÿ�
select *
from orders
where extract(month from orderdate)=1
and extract(day from orderdate)=12;

-- 10. ���￡ ��� ����� � ī�װ����� ������ ����� �˻��Ͻÿ�.
select u.name as �̸�,
    c.categoryname as ī�װ���,
    g.goods_name as ��ǰ��,
    o.total_price/g.goods_price as "��ǰ����",
    o.total_price as "�� ����"
from userdb u, goodsdb g, orders o, category c
where o.userdb_userid=u.userid
and o.goodsdb_goodsid=g.goodsid
and g.category_categoryid=c.categoryid;

-- 11. ī�װ� ���� ��ǰ�� �� ���ִ��� ���̽ÿ�
select categoryid as ī�װ���ȣ,
    categoryname as ī�װ��̸�,
    count(*) as ����
from category c, goodsdb g
where g.category_categoryid=c.categoryid
group by categoryid, categoryname
order by categoryid;

-- 12. ī�װ���ȣ 22������ ��ǰ�� ������ ���� �ִ���, ������ �����ߴ��� ���̽ÿ�.
select u.userid as ȸ����ȣ,
    u.name as �̸�,
    g.category_categoryid as ī�װ���ȣ,
    g.goodsid as ��ǰ��ȣ,
    g.goods_name as ��ǰ��,
    o.total_price/g.goods_price as ��ǰ����,
    o.total_price as �Ѱ���
from orders o, userdb u, goodsdb g
where o.userdb_userid=u.userid
and g.goodsid=o.goodsdb_goodsid
and category_categoryid=22;

-- 12. ������ 40000�� �̻��� ��ǰ�� �˻��ϼ���.
select *
from goodsdb
where goods_price>=40000;

-- 13. ������ 30000�� �̻� 40000�� ������ ��ǰ�� ������������ �˻��ϼ���.
select goods_name as ��ǰ��,
    goods_price as ����
from goodsdb
where goods_price between 30000 and 40000
order by goods_price;

-- 14. ������ ���� ����� ��Ḧ �˻��Ͻÿ�.
select *
from goodsdb g
where g.category_categoryid in (
    select categoryid
    from category
    where categoryname in ('������ ���', '����� ���')
);

-- 15. ������ ��� �� 2kg�� ��Ḧ �˻��Ͻÿ�.
select categoryname as ī�װ���,
    goods_name as ��ǰ��,
    goods_price as ����
from goodsdb g, category c
where g.goods_name like '%2kg%'
and c.categoryid=g.category_categoryid
and categoryname in '������ ���';

-- 16. ���� �ֹ��� ��ǰ�� ���Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
-- ��, �Ҽ����� ������ ��ȯ�Ͻÿ�.
select sum(total_price) as ���Ǹž�,
    round(avg(total_price)) as ��հ�,
    min(total_price) as ������,
    max(total_price) as �ְ�
from orders;

-- 17. ��ǰ�� ���������� ���並 ���� ���� ���� ���̽ÿ�.
select name
from userdb
minus
select name
from userdb
where userid in (select userdb_userid
    from review);
    
--18. ���� ���� �Ǹŵ� ��ǰ���� ����ϼ���.
select g.goods_name as �̸�, o.total_price/g.goods_price as ����
from orders o join goodsdb g on o.goodsdb_goodsid=g.goodsid
order by (o.total_price/g.goods_price) desc;

-- 19. ���� '��'���� ���� �˻��ϼ���.
select *
from userdb
where name like '��%';

-- 20. ������ �ֹ��󵵸� �˻��ϼ���.
select substr(address,1,2) as ����, count(*) as �ֹ���
from orders
group by substr(address,1,2)
order by count(*) desc;

-- 21. replace �� �̿��ؼ� ��ǰ ������ 7000���� ��ǰ�� 10%���� �ݾ����� �����ϼ���.
select goodsid as ��ǰ��ȣ,
    goods_name as ��ǰ��,
    replace(goods_price, 7000, 7000*0.9) as ����
from goodsdb
where goods_price=7000;

-- 22. �̺�Ʈ�� ���Ƚ��ϴ�. ������ ��Ḧ 30%�����ϼ���.
-- ��, 1�� ������ �ݿø��ϼ���.
select goodsid as ��ǰ��ȣ,
    goods_name as ��ǰ��,
    goods_price as ����,
    floor(goods_price*0.30*0.1)*10 as ���αݾ�,
    CEIL(goods_price*0.70*0.1)*10 as ���εȱݾ�
from goodsdb g join category c on c.categoryid=g.category_categoryid
where categoryname like '������ ���';

-- 23. ��¥ �� �ֹ����� �˻��ϼ���.
select orderdate, count(*)
from orders
group by orderdate
order by orderdate;

-- 24. �ֹ� ���� ���� ���Ϻ��� ���ʴ�� ���̽ÿ�.
select to_char(orderdate, 'dy'), count(*)
from orders
group by to_char(orderdate, 'dy')
order by count(*) desc;

-- 25. ȸ�������� ���̽ÿ�.
-- ��, ������ ���� ��� '(����)'���� ǥ���Ͻÿ�
select userid as ȸ������,
    name as �̸�,
    nvl(email, '(����)') as �̸���,
    nick_name as �г���,
    phone as ��ȭ��ȣ
from userdb;

-- 26. ȸ�������� �ϼ���.
insert into userdb values (1011, 'jeng', 'jeng', '��ó��', 'jeng@naver.com', '��ó��', '010-7878-4545');
select *
from userdb
where userid=1011;

-- 27. ȸ�������� ���̵��� ��й�ȣ�� 1234�� �����ϼ���.
update userdb
set loginpw=1234
where userid=1011;
select *
from userdb
where userid=1011;

-- 28. ���䰡 �ִ� ��ǰ��� ���䳻��, ���������� ���̽ÿ�.
select goods_name as ��ǰ��,
    title as ��������,
    r_contents as ���䳻��,
    nick_name as �г���,
    c.r_comment as ���
from review r, review_comment c, userdb u, goodsdb g
where r.review_id=c.review_review_id
and c.userdb_userid=u.userid
and g.goodsid=r.goodsdb_goodsid;

-- 29. �̺�Ʈ ���Դϴ�. 2���޿� ���� ���� �ݾ��� �� �� 3�п��� ��ǰ�� �帮���� �մϴ�.
-- 1�� 2�� 3���� �˻��ϰ�, ���� �� ���ݾ��� ���̽ÿ�.
select rownum as ���,
    name as �̸�,
    total as �ѻ��ݾ� 
from (select name, sum(o.total_price) total
    from userdb u join orders o on u.userid=o.userdb_userid
    where orderdate between '20240101' and '20240131'
    group by name
    order by sum(o.total_price) desc)
where rownum<=3
order by rownum;

-- 30. ���������� ������ �߰��Ͻÿ�.
-- ��, �����ڴ� ������ ����.
select *
from userdb;

alter table userdb add sex varchar(3) null;
update userdb
set sex='��'
where name not in ('������','������','��ö��','�ȿ���','��λ�','�����','��ó��');
update userdb
set sex='��'
where sex is null
and name not like '������';

-- 31. ���� ������� ���� ū ��¥�� �ѱݾ��� �˻��Ͻÿ�.
select orderdate, daily_total
from (select orderdate, sum(total_price) as daily_total
    from orders
    group by orderdate
    order by daily_total desc)
where ROWNUM=1;

-- 32. ���� ���� ��ǰ�� ��� ��ٱ��ϸ� ��ȸ�Ͻÿ�.
select userdb_userid, cnt
from (select userdb_userid, sum(goodscnt) cnt
      from basket
      group by userdb_userid)
where cnt=(select max(total_goodscnt)
           from (select sum(goodscnt) total_goodscnt
                 from basket
                 group by userdb_userid)
);
    
-- 33. ���� �ֱٿ� �ֹ��� ��ǰ��?
select goods_name
from goodsdb
where goodsid=(select goodsdb_goodsid
                from (select goodsdb_goodsid
                       from orders
                       order by orderdate desc)
                where rownum=1);

-- 34. ���� ���� ���䰡 �޸� ��ǰ�� �����ΰ���?
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

-- 35. ���� ���� ���並 �ۼ��� �� ��ȸ
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

-- 36. �� ī�װ� ���� ī�װ��� ���� ��ǰ�� ��� ������ ��ȸ�ϼ���.
select categoryname as ī�װ��̸�,
    round(avg(goods_price),-1) as ��հ���
from category c, goodsdb g
where c.categoryid=g.category_categoryid
group by categoryname, categoryid
order by categoryid;

-- 37. �ֹ��� ��ǰ �߿��� ���� ��� ��ǰ�� ������ ��ȸ�ϼ���.
-- ī�װ���ȣ, ī�װ���, ��ǰ��ȣ, ��ǰ��, ��ǰ����, ��ǰ����
select categoryid as ī�װ���ȣ,
    categoryname as ī�װ���,
    goodsid as ��ǰ��ȣ,
    goods_name as ��ǰ��,
    goods_price as ��ǰ����,
    goods_info as ��ǰ����
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




