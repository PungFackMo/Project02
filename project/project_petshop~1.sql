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
    '장바구니ID';

COMMENT ON COLUMN basket.userdb_userid IS
    '회원번호';

COMMENT ON COLUMN basket.goodsdb_goodsid IS
    '상품번호';

COMMENT ON COLUMN basket.goodscnt IS
    '상품갯수';

ALTER TABLE basket ADD CONSTRAINT basket_pk PRIMARY KEY ( basket_id );

CREATE TABLE category (
    categoryid   NUMBER NOT NULL,
    categoryname VARCHAR2(40 BYTE)
);

COMMENT ON COLUMN category.categoryid IS
    '카테고리번호';

COMMENT ON COLUMN category.categoryname IS
    '카테고리이름';

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
    '상품번호';

COMMENT ON COLUMN goodsdb.category_categoryid IS
    '카테고리번호
';

COMMENT ON COLUMN goodsdb.goods_name IS
    '상품명';

COMMENT ON COLUMN goodsdb.goods_price IS
    '상품가격';

COMMENT ON COLUMN goodsdb.goods_info IS
    '상품 설명';

COMMENT ON COLUMN goodsdb.goods_stock IS
    '재고 수량';

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
    '문의번호';

COMMENT ON COLUMN inquiry_page.userdb_userid IS
    '회원번호';

COMMENT ON COLUMN inquiry_page.goodsdb_goodsid IS
    '상품번호';

COMMENT ON COLUMN inquiry_page.title IS
    '문의제목';

COMMENT ON COLUMN inquiry_page.contents IS
    '문의내용';

COMMENT ON COLUMN inquiry_page.reg_date IS
    '작성일';

COMMENT ON COLUMN inquiry_page.mod_date IS
    '수정일';

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
    '주문번호';

COMMENT ON COLUMN orders.userdb_userid IS
    '회원번호';

COMMENT ON COLUMN orders.goodsdb_goodsid IS
    '상품번호';

COMMENT ON COLUMN orders.orderdate IS
    '주문날짜';

COMMENT ON COLUMN orders.address_num IS
    '우편번호';

COMMENT ON COLUMN orders.address IS
    '주소';

COMMENT ON COLUMN orders.detail_address IS
    '상세주소';

COMMENT ON COLUMN orders.phone IS
    '전화번호';

COMMENT ON COLUMN orders.total_pirce IS
    '총 주문금액';

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
    '리뷰번호';

COMMENT ON COLUMN review.orders_orderid IS
    '주문번호';

COMMENT ON COLUMN review.userdb_userid IS
    '회원번호';

COMMENT ON COLUMN review.goodsdb_goodsid IS
    '상품번호';

COMMENT ON COLUMN review.title IS
    '리뷰제목';

COMMENT ON COLUMN review.contents IS
    '리뷰내용';

COMMENT ON COLUMN review.reg_date IS
    '작성일';

COMMENT ON COLUMN review.mod_date IS
    '수정일';

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
    '댓글번호';

COMMENT ON COLUMN review_comment.userdb_userid IS
    '회원번호';

COMMENT ON COLUMN review_comment.review_review_id IS
    '리뷰번호';

COMMENT ON COLUMN review_comment."comment" IS
    '댓글내용';

COMMENT ON COLUMN review_comment.reg_date IS
    '작성일';

COMMENT ON COLUMN review_comment.mod_date IS
    '수정일';

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
    '회원번호';

COMMENT ON COLUMN userdb.loginid IS
    '로그인ID';

COMMENT ON COLUMN userdb.loginpw IS
    '로그인PW';

COMMENT ON COLUMN userdb.name IS
    '이름';

COMMENT ON COLUMN userdb.email IS
    '이메일';

COMMENT ON COLUMN userdb.nick_name IS
    '닉네임';

COMMENT ON COLUMN userdb.phone IS
    '전화번호';

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
