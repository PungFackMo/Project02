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
where userid=1011; -- ȸ����ȣ 1011��

-- 04. �̸����� �ִ� ����� ��ȸ�Ͻÿ�
select name as �̸�,
    email as �̸���
from userdb
where email is not null; -- �̸����� null�� �ƴ� ���

-- 05. �ֹ������� ���̽ÿ�
select *
from orders;

-- 06. ���θ��� �� ������ ���̽ÿ�
select sum(total_pirce) as "�Ѹ���(��)" -- �����Լ�
from orders;

-- 07. ȸ����ȣ 1001���� �ֹ������� ���̽ÿ�
select *
from orders
where userdb_userid=1001; -- ȸ����ȣ�� 1001��

-- 08. 1������ �ֹ������� ���̽ÿ�
select *
from orders
where extract(month from orderdate)=1; -- ���� 1���� ���� ����

-- 09. 1�� 12���� �ֹ������� ���̽ÿ�
select *
from orders
where extract(month from orderdate)=1 -- ���� 1���� ���� ����
and extract(day from orderdate)=12; -- ���� 12���� ���� ����

-- 10. ���￡ ��� ����� � ī�װ����� ������ ����� �˻��Ͻÿ�.
select u.name as �̸�,
    c.categoryname as ī�װ���,
    g.goods_name as ��ǰ��,
    o.total_price/g.goods_price as "��ǰ����",
    o.total_price as "�� ����"
from userdb u, goodsdb g, orders o, category c
where o.userdb_userid=u.userid      -- orders���̺� userdb���̺��� ����
and o.goodsdb_goodsid=g.goodsid     -- orders���̺� goodsdb���̺��� ����
and g.category_categoryid=c.categoryid; -- goodsdb���̺� category���̺��� ����

-- 11. ī�װ� ���� ��ǰ�� �� ���ִ��� ���̽ÿ�
select categoryid as ī�װ���ȣ,
    categoryname as ī�װ��̸�,
    count(*) as ����
from category c, goodsdb g
where g.category_categoryid=c.categoryid    -- goodsdb���̺� category���̺��� ����
group by categoryid, categoryname           -- �����Լ��� �ֱ⿡ group���� ����
order by categoryid;                        -- categoryid�� ��������

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
where goods_price>=40000; --��ǰ������ 40000���̻�

-- 13. ������ 30000�� �̻� 40000�� ������ ��ǰ�� ������������ �˻��ϼ���.
select goods_name as ��ǰ��,
    goods_price as ����
from goodsdb
where goods_price between 30000 and 40000 --��ǰ������ 30000���̻� 40000������
order by goods_price; -- ��ǰ�������� �������� ����

-- 14. ������ ���� ����� ��Ḧ �˻��Ͻÿ�.
select *
from goodsdb g
where g.category_categoryid in (
    select categoryid
    from category
    where categoryname in ('������ ���', '����� ���')); -- ��ø����

-- 15. ������ ��� �� 2kg�� ��Ḧ �˻��Ͻÿ�.
select categoryname as ī�װ���,
    goods_name as ��ǰ��,
    goods_price as ����
from goodsdb g, category c
where g.goods_name like '%2kg%' -- 2kg�� ���Ե� ���� �˻�
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
    from review); -- ��ø����
    
--18. ���� ���� �Ǹŵ� ��ǰ���� ����ϼ���.
select g.goods_name as �̸�, o.total_price/g.goods_price as ����
from orders o join goodsdb g on o.goodsdb_goodsid=g.goodsid
order by (o.total_price/g.goods_price) desc; -- ��������

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
    order by sum(o.total_price) desc) -- �ζ��κ�
where rownum<=3 -- ���������� ������ ���� 3�������� ������
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
    order by daily_total desc) -- �ٷ� rownum�� ����ϸ� rownum�� ����ǰ� ������������ �����Ǳ⿡ from������ ���� ������������ ���� �� rownum ����
where ROWNUM=1;

-- 32. ���� ���� ��ǰ�� ��� ��ٱ��ϸ� ��ȸ�Ͻÿ�.
select userdb_userid, cnt -- 3. A�� ������ �ִ� ȸ����ȣ�� ã�ƿ�
from (select userdb_userid, sum(goodscnt) cnt
      from basket
      group by userdb_userid) -- 1. ���� ���̵� ��ٱ��� ��ǰ ����
where cnt=(select max(total_goodscnt)
           from (select sum(goodscnt) total_goodscnt
                 from basket
                 group by userdb_userid) -- 2. ��ٱ��� ��ǰ ������ ���� ���� ���� �˻� = A
);
    
-- 33. ���� �ֱٿ� �ֹ��� ��ǰ��?
select goods_name -- 3. ���� ��ǰ��ȣ�� ������ �ִ� ��ǰ���� ��ȯ
from goodsdb
where goodsid=(select goodsdb_goodsid -- 2. ������� ���ĵ� �� �߿��� rownum��ŭ ��ǰ��ȣ�� ��ȯ = ���� ��ǰ��ȣ
                from (select goodsdb_goodsid --1. orders���̺��� ��¥ ������������ ����
                       from orders
                       order by orderdate desc)
                where rownum=1);

-- 34. ���� ���� ���䰡 �޸� ��ǰ�� �����ΰ���?
select goods_name --3. ���� ��ǰ��ȣ�� ������ �ִ� ��ǰ���� ��ȯ
from goodsdb
where goodsid=(
    select goodsdb_goodsid -- 2. ������� ���ĵ� �� �߿��� rownum��ŭ ��ǰ��ȣ�� ��ȯ = ���� ��ǰ��ȣ
    from (
        select r.goodsdb_goodsid, count(*) as review_count -- 1. ��ǰ��ȣ�� �� ��ǰ��ȣ�� ���� ������ ������������ ��ȯ
        from review r
        group by r.goodsdb_goodsid
        order by count(*) desc
    ) 
    where rownum=1
);

-- 35. ���� ���� ���並 �ۼ��� �� ��ȸ
select name -- 3. ���� ȸ����ȣ�� ������ �ִ� �̸� ��ȯ
from userdb
where userid=(
    select userdb_userid -- 2. ������� ���ĵ� �� �߿��� rownum��ŭ ȸ����ȣ�� ��ȯ = ���� ȸ����ȣ
    from (
        select userdb_userid, count(*) -- 1. ȸ����ȣ�� ���� ������ ������������ �����ϰ� ��ȯ
        from review
        group by userdb_userid
        order by count(*) desc
    )
    where rownum = 1
);

-- 36. �� ī�װ� ���� ī�װ��� ���� ��ǰ�� ��� ������ ��ȸ�ϼ���.
select categoryname as ī�װ��̸�,
    round(avg(goods_price),-1) as ��հ��� -- round �Լ� -1: 1���ڸ� �ݿø�
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
    select goodsdb_goodsid -- 2. ���ĵ� �� �߿��� rownum ��ŭ ��ǰ��ȣ�� ��ȯ
    from (
        select goodsdb_goodsid, goods_price -- 1. �ֹ��� �� �߿��� ��ǰ��ȣ�� ��ǰ������ ������������ ��ȯ
        from orders o1, goodsdb g1
        where o1.goodsdb_goodsid=g1.goodsid
        order by goods_price desc
    )
    where rownum=1
);

-- 38. 3���� �ֹ��� ��ǰ�� ��ǰ��ȣ, ��ǰ�̸�, �ֹ��� ��� �̸�, �����ȣ, �ּ�, ���ּҸ� �����ִ� d_orders�並 �����Ͻÿ�.
create view d_orders
as select goodsid as ��ǰ��ȣ,
    goods_name as ��ǰ�̸�,
    name as �̸�,
    address_num as �����ȣ,
    address as �ּ�,
    detail_address as ���ּ�
from goodsdb g, orders o, userdb u
where g.goodsid=o.goodsdb_goodsid
and o.userdb_userid=u.userid;

-- 39. ������ �並 �̿��Ͽ� �ֹ��� ��ǰ�� �̸��� �ֹ��� ��� �̸��� ����ϴ� sql���� �ۼ��Ͻÿ�.
select ��ǰ�̸�, �̸�
from d_orders;

-- 40. d_orders �並 �����ϰ��� �Ѵ�. �ǸŰ��� �Ӽ��� �߰��ϰ� ���ּҿ� �����ּҸ� �����ϴ� ����� �����Ͻÿ�.
create or replace view d_orders(goodsid , goods_name, name, address, total_price)
as select goodsid as ��ǰ��ȣ,
    goods_name as ��ǰ�̸�,
    name as �̸�,
    address as �ּ�,
    total_price as �ǸŰ���
from goodsdb g, orders o, userdb u
where g.goodsid=o.goodsdb_goodsid
and o.userdb_userid=u.userid;

select *
from d_orders;

-- 41. ȸ���� �̸��� �ֹ��� ��ǰ�� �̸��� ���̽ÿ�. (����/��Į�� �μ����� ���)
select (select name 
    from userdb u 
    where o.userdb_userid=u.userid) as ȸ���̸�,
    goods_name as ��ǰ�̸�
from goodsdb g join orders o on g.goodsid=o.goodsdb_goodsid;

-- 42. �ּҰ� �λ��̰� ���並 �� ����� �̸��� ���̽ÿ�. (����/�ζ��� ��/��ø����/exists ���)
select distinct name
from (select name
    from userdb u join orders o on u.userid=o.userdb_userid
    where address like '%�λ�%')
where exists (select userdb_userid
            from review r, userdb u1
            where r.userdb_userid=u1.userid);

-- 43. ��ü �ֹ��ݾ� ��պ��� ���� �ֹ��� ȸ���� �̸��� ���̽ÿ�.
select name
from userdb u 
join (select userdb_userid, sum(total_price) as tp
    from orders
    group by userdb_userid) uo 
on u.userid=uo.userdb_userid
where tp<(select avg(total_price) from orders);

-- 44. ���￡�� ���� ��ü �ֹ��ݾ� ��պ��� ���� �ֹ��� ȸ���� �̸��� ���̽ÿ�.
select name
from userdb u
join (select userdb_userid, sum(total_price) as tp --1. ���￡ ��� ȸ���� ȸ����ȣ�� �ֹ��ݾ������� �˻�
    from orders
    where address like '%����%'
    group by userdb_userid) uo 
on u.userid=uo.userdb_userid
where tp>(select avg(total_price) from orders where address like '%����%'); -- ���￡ ��� ȸ���� �ֹ��ݾ����հ� ���� ��ü �ֹ��ݾ� ����� ��

-- 45. �ֹ��� ��ǰ�� �� ���� ���� ��ǰ���� ���� ī�װ� �̸��� ���̽ÿ�.
select categoryname
from (select categoryname, count(categoryname) -- 2. �ֹ��� ��ǰ��ȣ�� ���Ե� ī�װ���� �ֹ��� ��ǰ ������ ��ȯ, ������������ ����
    from goodsdb g
    join category c 
    on c.categoryid=g.category_categoryid
    where g.goodsid in (select goodsdb_goodsid
                    from orders) --1. �ֹ��� ��ǰ��ȣ�� ��ȯ
    group by categoryname
    order by count(categoryname) desc)
where rownum=1; --3. rownum ��ŭ ��ȯ

-- 46. ���� ����������(inquiry_page)�� ������ �ڸ�Ʈ�� ����ϴ� ���̺��� �����ϴ�.
-- ���ο� ���̺�(IPcomment)�� ����� ��� ���ǿ� ���� �Ͻÿ�.
create table IPcomment ( -- ���̺� ����
    IP_comment_id number primary key,   -- �⺻Ű �Ҵ�
    IP_comment clob not null,
    reg_date date not null,
    inquiry_page_inquiry_id number,
    FOREIGN KEY (inquiry_page_inquiry_id) references inquiry_page(inquiry_id)); -- �ܷ�Ű �Ҵ�
alter table IPcomment modify inquiry_page_inquiry_id number not null; -- null�� ���� �� ���� ���� ����

insert into IPcomment values (1001, '���� ��ȹ�� �̺�Ʈ�� �����ϴ�.', '20240105', 10101);
insert into IPcomment values (1002, '���� �ֹ��� ���� 3���̳��� ��ۿϷ�˴ϴ�..', '20240218', 10102);
insert into IPcomment values (1003, '���� �԰��ȹ�� �����ϴ�.', '20240218', 10103);
insert into IPcomment values (1004, '�Ծ �˴ϴ�.', '20240222', 10104);
insert into IPcomment values (1005, '�׷� ��ȹ �����ϴ�.', '20240229', 10105);
insert into IPcomment values (1006, '��ϵ� �̸��Ϸ� �ӽ� ��й�ȣ�� ���½��ϴ�.', '20240503', 10106);

-- 47. ���ǹ�ȣ, ��������, ���ǳ���, ���ǳ����ۼ���¥, �����ڸ�Ʈ, �����ڸ�Ʈ�ۼ���¥ �� ��Ÿ���� ��(IPview)�� ���弼��
create view IPview -- �� ����
as select inquiry_id as ���ǹ�ȣ,
    title as ��������,
    i_contents as ���ǳ���,
    ip.reg_date as ���ǳ����ۼ���¥,
    ip_comment as �����ڸ�Ʈ,
    ipc.reg_date as �����ڸ�Ʈ�ۼ���¥
from inquiry_page ip
join IPcomment ipc
on ip.inquiry_id=ipc.inquiry_page_inquiry_id;

select *
from IPview;

-- 48. �� ī�װ��� ��ձݾ��� ���Ͻÿ�.
-- ��, 1�� ������ �����ʽÿ�
select categoryname as ī�װ���,
    round(avg(goods_price)*0.1)*10 as ��ձݾ�
from category c
join goodsdb g
on g.category_categoryid=c.categoryid
group by categoryname;

-- 49. �� ī�װ����� ���� ��� ��ǰ�� ������ ã������.
select categoryname, goods_name, Maxprice
from category c
join (select category_categoryid, max(goods_price) as Maxprice -- 1. ī�װ���ȣ�� ��ȣ�� ���� ��� ��ǰ ���� ��ȯ
    from goodsdb
    group by category_categoryid) g
on c.categoryid=g.category_categoryid
join goodsdb g2 on c.categoryid=g2.category_categoryid and g2.goods_price=Maxprice; -- 2. ��ǰDB�� ����(��ǰ�̸����ؼ�)


-- 50. �� ȸ���� �ֹ��� ��ǰ �߿��� ��� ������ �Ѵ� ��ǰ�� ���� ã��
select userid, name, count(*)
from userdb u
join (select goods_price, total_price, userdb_userid, round(avg(goods_price)*0.1)*10 as AvgPrice -- 1. ��ǰ����, �ֹ��ݾ�, ȸ����ȣ, ��ǰ��������� ��ȯ�� userdb ���̺� ����
    from orders o, goodsdb g
    where o.goodsdb_goodsid=g.goodsid
    group by goods_price,total_price, userdb_userid) og
on u.userid=og.userdb_userid
where total_price/goods_price*total_price > AvgPrice -- 2. �ֹ��� ��ǰ ���ݰ� ��ǰ��������� ��
group by userid,name;
