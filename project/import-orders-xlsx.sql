SET DEFINE OFF

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10001, 1001, 63001, to_date('01/02/2024', 'MM/DD/RRRR'), '12345', '부산시 진구 동평로352', '102-301', (select phone from userdb where userid=1001), (select goods_price*1 from goodsdb where goodsid=63001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10002, 1002, 11001, to_date('01/03/2024', 'MM/DD/RRRR'), '45678', '부산시 해운대구 반송대로111', '101-1001', (select phone from userdb where userid=1002), (select goods_price*8 from goodsdb where goodsid=11001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10003, 1009, 82004, to_date('01/04/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=82004));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10004, 1001, 81005, to_date('01/05/2024', 'MM/DD/RRRR'), '12345', '부산시 진구 동평로352', '102-301', (select phone from userdb where userid=1001), (select goods_price*4 from goodsdb where goodsid=81005));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10005, 1004, 23024, to_date('01/12/2024', 'MM/DD/RRRR'), '2536', '서울 동대문구 전농로10길 20', '109-2501', (select phone from userdb where userid=1004), (select goods_price*10 from goodsdb where goodsid=23024));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10006, 1009, 81035, to_date('01/12/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=81035));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10007, 1004, 23025, to_date('01/13/2024', 'MM/DD/RRRR'), '2536', '서울 동대문구 전농로10길 20', '109-2501', (select phone from userdb where userid=1004), (select goods_price*11 from goodsdb where goodsid=23025));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10008, 1001, 81001, to_date('01/15/2024', 'MM/DD/RRRR'), '12345', '부산시 진구 동평로352', '102-301', (select phone from userdb where userid=1001), (select goods_price*3 from goodsdb where goodsid=81001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10009, 1006, 63001, to_date('01/17/2024', 'MM/DD/RRRR'), '4011', '서울 마포구 망원로10길 6', '101-203', (select phone from userdb where userid=1006), (select goods_price*1 from goodsdb where goodsid=63001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10010, 1001, 71004, to_date('01/25/2024', 'MM/DD/RRRR'), '12345', '부산시 진구 동평로352', '102-301', (select phone from userdb where userid=1001), (select goods_price*5 from goodsdb where goodsid=71004));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10011, 1001, 82001, to_date('02/02/2024', 'MM/DD/RRRR'), '12345', '부산시 진구 동평로352', '102-301', (select phone from userdb where userid=1001), (select goods_price*2 from goodsdb where goodsid=82001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10012, 1004, 23022, to_date('02/02/2024', 'MM/DD/RRRR'), '2536', '서울 동대문구 전농로10길 20', '109-2501', (select phone from userdb where userid=1004), (select goods_price*2 from goodsdb where goodsid=23022));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10013, 1002, 21001, to_date('02/04/2024', 'MM/DD/RRRR'), '45678', '부산시 해운대구 반송대로111', '101-1001', (select phone from userdb where userid=1002), (select goods_price*2 from goodsdb where goodsid=21001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10014, 1003, 22020, to_date('02/06/2024', 'MM/DD/RRRR'), '24777', '부산시 남구 황령대로 2', '106-1013', (select phone from userdb where userid=1003), (select goods_price*10 from goodsdb where goodsid=22020));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10015, 1003, 22009, to_date('02/09/2024', 'MM/DD/RRRR'), '24777', '부산시 남구 황령대로 2', '106-1013', (select phone from userdb where userid=1003), (select goods_price*10 from goodsdb where goodsid=22009));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10016, 1007, 61002, to_date('02/10/2024', 'MM/DD/RRRR'), '21910', '인천 연수구 선학로 101', '103-1807', (select phone from userdb where userid=1007), (select goods_price*1 from goodsdb where goodsid=61002));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10017, 1004, 23023, to_date('02/11/2024', 'MM/DD/RRRR'), '2536', '서울 동대문구 전농로10길 20', '109-2501', (select phone from userdb where userid=1004), (select goods_price*4 from goodsdb where goodsid=23023));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10018, 1009, 81031, to_date('02/11/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=81031));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10019, 1004, 23026, to_date('02/15/2024', 'MM/DD/RRRR'), '2536', '서울 동대문구 전농로10길 20', '109-2501', (select phone from userdb where userid=1004), (select goods_price*8 from goodsdb where goodsid=23026));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10020, 1004, 23027, to_date('02/15/2024', 'MM/DD/RRRR'), '2536', '서울 동대문구 전농로10길 20', '109-2501', (select phone from userdb where userid=1004), (select goods_price*7 from goodsdb where goodsid=23027));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10021, 1006, 41004, to_date('02/15/2024', 'MM/DD/RRRR'), '4011', '서울 마포구 망원로10길 6', '101-203', (select phone from userdb where userid=1006), (select goods_price*1 from goodsdb where goodsid=41004));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10022, 1007, 52010, to_date('02/15/2024', 'MM/DD/RRRR'), '21910', '인천 연수구 선학로 101', '103-1807', (select phone from userdb where userid=1007), (select goods_price*1 from goodsdb where goodsid=52010));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10023, 1005, 63001, to_date('02/16/2024', 'MM/DD/RRRR'), '7221', '서울 영등포구 국회대로 597', '103-2103', (select phone from userdb where userid=1005), (select goods_price*1 from goodsdb where goodsid=63001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10024, 1006, 31001, to_date('02/16/2024', 'MM/DD/RRRR'), '4011', '서울 마포구 망원로10길 6', '101-203', (select phone from userdb where userid=1006), (select goods_price*1 from goodsdb where goodsid=31001));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10025, 1003, 22008, to_date('02/18/2024', 'MM/DD/RRRR'), '24777', '부산시 남구 황령대로 2', '106-1013', (select phone from userdb where userid=1003), (select goods_price*10 from goodsdb where goodsid=22008));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10026, 1009, 81032, to_date('02/21/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=81032));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10027, 1008, 81015, to_date('02/22/2024', 'MM/DD/RRRR'), '41911', '대구 중구 국채보상로131길 55', '102-1103', (select phone from userdb where userid=1008), (select goods_price*1 from goodsdb where goodsid=81015));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10028, 1008, 81016, to_date('02/23/2024', 'MM/DD/RRRR'), '41911', '대구 중구 국채보상로131길 55', '102-1103', (select phone from userdb where userid=1008), (select goods_price*1 from goodsdb where goodsid=81016));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10029, 1008, 81017, to_date('02/24/2024', 'MM/DD/RRRR'), '41911', '대구 중구 국채보상로131길 55', '102-1103', (select phone from userdb where userid=1008), (select goods_price*4 from goodsdb where goodsid=81017));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10030, 1002, 21009, to_date('02/25/2024', 'MM/DD/RRRR'), '45678', '부산시 해운대구 반송대로111', '101-1001', (select phone from userdb where userid=1002), (select goods_price*3 from goodsdb where goodsid=21009));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10031, 1008, 81018, to_date('02/25/2024', 'MM/DD/RRRR'), '41911', '대구 중구 국채보상로131길 55', '102-1103', (select phone from userdb where userid=1008), (select goods_price*2 from goodsdb where goodsid=81018));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10032, 1008, 81019, to_date('02/25/2024', 'MM/DD/RRRR'), '41911', '대구 중구 국채보상로131길 55', '102-1103', (select phone from userdb where userid=1008), (select goods_price*3 from goodsdb where goodsid=81019));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10033, 1009, 81033, to_date('02/29/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=81033));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10034, 1009, 81034, to_date('03/01/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=81034));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10035, 1009, 82005, to_date('03/03/2024', 'MM/DD/RRRR'), '61974', '광주 서구 화운로193번길 25', '101-2001', (select phone from userdb where userid=1009), (select goods_price*1 from goodsdb where goodsid=82005));

INSERT INTO ORDERS (ORDERID, USERDB_USERID, GOODSDB_GOODSID, ORDERDATE, ADDRESS_NUM, ADDRESS, DETAIL_ADDRESS, PHONE, TOTAL_PRICE) 
VALUES (10036, 1003, 22007, to_date('03/07/2024', 'MM/DD/RRRR'), '24777', '부산시 남구 황령대로 2', '106-1013', (select phone from userdb where userid=1003), (select goods_price*10 from goodsdb where goodsid=22007));

