drop table review_comment;
drop table review;
drop table inquiry_page;
drop table basket;
drop table orders;
drop table userdb;
drop table goodsdb;
drop table category;


CREATE TABLE basket (
    basket_id       NUMBER NOT NULL,
    userdb_userid   NUMBER,
    goodsdb_goodsid NUMBER NOT NULL,
    goodscnt        NUMBER NOT NULL
);

COMMENT ON COLUMN basket.basket_id IS
    '��ٱ���ID';

COMMENT ON COLUMN basket.userdb_userid IS
    'ȸ����ȣ';

COMMENT ON COLUMN basket.goodsdb_goodsid IS
    '��ǰ��ȣ';

COMMENT ON COLUMN basket.goodscnt IS
    '��ǰ����';

ALTER TABLE basket ADD CONSTRAINT basket_pk PRIMARY KEY ( basket_id );

CREATE TABLE category (
    categoryid   NUMBER NOT NULL,
    categoryname VARCHAR2(40 BYTE)
);

COMMENT ON COLUMN category.categoryid IS
    'ī�װ���ȣ';

COMMENT ON COLUMN category.categoryname IS
    'ī�װ��̸�';

ALTER TABLE category ADD CONSTRAINT categori_pk PRIMARY KEY ( categoryid );

CREATE TABLE goodsdb (
    goodsid             NUMBER NOT NULL,
    category_categoryid NUMBER NOT NULL,
    goods_name          VARCHAR2(200 BYTE) NOT NULL,
    goods_price         NUMBER NOT NULL,
    goods_info          VARCHAR2(4000 BYTE),
    goods_stock         NUMBER NOT NULL
);

COMMENT ON COLUMN goodsdb.goodsid IS
    '��ǰ��ȣ';

COMMENT ON COLUMN goodsdb.category_categoryid IS
    'ī�װ���ȣ
';

COMMENT ON COLUMN goodsdb.goods_name IS
    '��ǰ��';

COMMENT ON COLUMN goodsdb.goods_price IS
    '��ǰ����';

COMMENT ON COLUMN goodsdb.goods_info IS
    '��ǰ ����';

COMMENT ON COLUMN goodsdb.goods_stock IS
    '��� ����';

ALTER TABLE goodsdb ADD CONSTRAINT goodsdb_pk PRIMARY KEY ( goodsid );

CREATE TABLE inquiry_page (
    inquiry_id      NUMBER NOT NULL,
    userdb_userid   NUMBER NOT NULL,
    goodsdb_goodsid NUMBER,
    title           VARCHAR2(20 BYTE) NOT NULL,
    contents        CLOB NOT NULL,
    reg_date        DATE NOT NULL,
    mod_date        DATE NOT NULL
);

COMMENT ON COLUMN inquiry_page.inquiry_id IS
    '���ǹ�ȣ';

COMMENT ON COLUMN inquiry_page.userdb_userid IS
    'ȸ����ȣ';

COMMENT ON COLUMN inquiry_page.goodsdb_goodsid IS
    '��ǰ��ȣ';

COMMENT ON COLUMN inquiry_page.title IS
    '��������';

COMMENT ON COLUMN inquiry_page.contents IS
    '���ǳ���';

COMMENT ON COLUMN inquiry_page.reg_date IS
    '�ۼ���';

COMMENT ON COLUMN inquiry_page.mod_date IS
    '������';

ALTER TABLE inquiry_page ADD CONSTRAINT inquiry_page_pk PRIMARY KEY ( inquiry_id );

CREATE TABLE orders (
    orderid         NUMBER NOT NULL,
    userdb_userid   NUMBER,
    goodsdb_goodsid NUMBER NOT NULL,
    orderdate       DATE NOT NULL,
    address_num     VARCHAR2(10 BYTE) NOT NULL,
    address         VARCHAR2(150 BYTE) NOT NULL,
    detail_address  VARCHAR2(50 BYTE) NOT NULL,
    phone           VARCHAR2(26 BYTE) NOT NULL,
    total_price     NUMBER NOT NULL
);

COMMENT ON COLUMN orders.orderid IS
    '�ֹ���ȣ';

COMMENT ON COLUMN orders.userdb_userid IS
    'ȸ����ȣ';

COMMENT ON COLUMN orders.goodsdb_goodsid IS
    '��ǰ��ȣ';

COMMENT ON COLUMN orders.orderdate IS
    '�ֹ���¥';

COMMENT ON COLUMN orders.address_num IS
    '�����ȣ';

COMMENT ON COLUMN orders.address IS
    '�ּ�';

COMMENT ON COLUMN orders.detail_address IS
    '���ּ�';

COMMENT ON COLUMN orders.phone IS
    '��ȭ��ȣ';

COMMENT ON COLUMN orders.total_pirce IS
    '�� �ֹ��ݾ�';

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( orderid );

CREATE TABLE review (
    review_id       NUMBER NOT NULL,
    orders_orderid  NUMBER NOT NULL,
    userdb_userid   NUMBER NOT NULL,
    goodsdb_goodsid NUMBER NOT NULL,
    title           VARCHAR2(40 BYTE),
    contents        CLOB,
    reg_date        DATE NOT NULL,
    mod_date        DATE NOT NULL
);

COMMENT ON COLUMN review.review_id IS
    '�����ȣ';

COMMENT ON COLUMN review.orders_orderid IS
    '�ֹ���ȣ';

COMMENT ON COLUMN review.userdb_userid IS
    'ȸ����ȣ';

COMMENT ON COLUMN review.goodsdb_goodsid IS
    '��ǰ��ȣ';

COMMENT ON COLUMN review.title IS
    '��������';

COMMENT ON COLUMN review.contents IS
    '���䳻��';

COMMENT ON COLUMN review.reg_date IS
    '�ۼ���';

COMMENT ON COLUMN review.mod_date IS
    '������';

ALTER TABLE review ADD CONSTRAINT review_pk PRIMARY KEY ( review_id );

CREATE TABLE review_comment (
    comment_id       NUMBER NOT NULL,
    userdb_userid    NUMBER NOT NULL,
    review_review_id NUMBER NOT NULL,
    "comment"        CLOB,
    reg_date         DATE NOT NULL,
    mod_date         DATE NOT NULL
);

COMMENT ON COLUMN review_comment.comment_id IS
    '��۹�ȣ';

COMMENT ON COLUMN review_comment.userdb_userid IS
    'ȸ����ȣ';

COMMENT ON COLUMN review_comment.review_review_id IS
    '�����ȣ';

COMMENT ON COLUMN review_comment."comment" IS
    '��۳���';

COMMENT ON COLUMN review_comment.reg_date IS
    '�ۼ���';

COMMENT ON COLUMN review_comment.mod_date IS
    '������';

ALTER TABLE review_comment ADD CONSTRAINT review_comment_pk PRIMARY KEY ( comment_id );

CREATE TABLE userdb (
    userid    NUMBER NOT NULL,
    loginid   VARCHAR2(40 BYTE) NOT NULL,
    loginpw   VARCHAR2(100 BYTE) NOT NULL,
    name      VARCHAR2(50 BYTE) NOT NULL,
    email     VARCHAR2(40 BYTE),
    nick_name VARCHAR2(50 BYTE) NOT NULL,
    phone     VARCHAR2(26 BYTE) NOT NULL
);

COMMENT ON COLUMN userdb.userid IS
    'ȸ����ȣ';

COMMENT ON COLUMN userdb.loginid IS
    '�α���ID';

COMMENT ON COLUMN userdb.loginpw IS
    '�α���PW';

COMMENT ON COLUMN userdb.name IS
    '�̸�';

COMMENT ON COLUMN userdb.email IS
    '�̸���';

COMMENT ON COLUMN userdb.nick_name IS
    '�г���';

COMMENT ON COLUMN userdb.phone IS
    '��ȭ��ȣ';

ALTER TABLE userdb ADD CONSTRAINT userdb_pk PRIMARY KEY ( userid );

ALTER TABLE basket
    ADD CONSTRAINT basket_goodsdb_fk FOREIGN KEY ( goodsdb_goodsid )
        REFERENCES goodsdb ( goodsid );

ALTER TABLE basket
    ADD CONSTRAINT basket_userdb_fk FOREIGN KEY ( userdb_userid )
        REFERENCES userdb ( userid );

ALTER TABLE goodsdb
    ADD CONSTRAINT goodsdb_category_fk FOREIGN KEY ( category_categoryid )
        REFERENCES category ( categoryid );

ALTER TABLE inquiry_page
    ADD CONSTRAINT inquiry_page_goodsdb_fk FOREIGN KEY ( goodsdb_goodsid )
        REFERENCES goodsdb ( goodsid );

ALTER TABLE inquiry_page
    ADD CONSTRAINT inquiry_page_userdb_fk FOREIGN KEY ( userdb_userid )
        REFERENCES userdb ( userid );

ALTER TABLE orders
    ADD CONSTRAINT orders_goodsdb_fk FOREIGN KEY ( goodsdb_goodsid )
        REFERENCES goodsdb ( goodsid );

ALTER TABLE orders
    ADD CONSTRAINT orders_userdb_fk FOREIGN KEY ( userdb_userid )
        REFERENCES userdb ( userid );

ALTER TABLE review_comment
    ADD CONSTRAINT review_comment_review_fk FOREIGN KEY ( review_review_id )
        REFERENCES review ( review_id );

ALTER TABLE review_comment
    ADD CONSTRAINT review_comment_userdb_fk FOREIGN KEY ( userdb_userid )
        REFERENCES userdb ( userid );

ALTER TABLE review
    ADD CONSTRAINT review_goodsdb_fk FOREIGN KEY ( goodsdb_goodsid )
        REFERENCES goodsdb ( goodsid );

ALTER TABLE review
    ADD CONSTRAINT review_orders_fk FOREIGN KEY ( orders_orderid )
        REFERENCES orders ( orderid );

ALTER TABLE review
    ADD CONSTRAINT review_userdb_fk FOREIGN KEY ( userdb_userid )
        REFERENCES userdb ( userid );
