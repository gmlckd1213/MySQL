/*
실습01 - 기본적인 데이터 조회 (1)
*/

-- 데이터베이스 연결
USE MyShop2019;


-- Q01) customer 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.

SELECT * FROM customer;

-- Q02) employee 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.

SELECT * FROM employee;

-- Q03) product 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.

SELECT * FROM product;

-- Q04) order_header 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
SELECT * FROM order_header;


-- Q05) order_detail 테이블 모든 행과 열을 조회하고 어떤 열들이 있는지, 데이터 형식은 어떻게 되는지 살펴보세요.
SELECT * FROM order_detail;


-- Q06) 모든 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.

SELECT customer_name, customer_id, gender, city, phone, point
FROM customer;

-- Q07) 모든 고객의 아이디, 이름, 지역, 성별, 이메일, 전화번호를 조회하세요.

 SELECT customer_id, customer_name, city, gender, email, phone
 FROM customer;
 
-- Q08) 모든 직원의 이름, 사원번호, 성별, 입사일, 전화번호를 조회하세요.
SELECT employee_name, employee_id, gender, hire_date, phone
FROM employee;

    
-- Q09) 이름이 '홍길동'인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.

SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE customer_name = '홍길동';

-- Q10) 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE gender = 'F';


-- Q11) '울산' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.

SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE city = '울산';

-- Q12) 포인트가 500,000 이상인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE point >= 500000;


-- Q13) 이름에 공백이 들어간 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer 
WHERE customer_name LIKE '% %';


-- Q14) 전화번호가 010으로 시작하지 않는 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE phone NOT LIKE '010%';
 
 
-- Q15) 포인트가 500,000 이상 '서울' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE point >= 500000
AND city = '서울';


-- Q16) 포인트가 500,000 이상인 '서울' 이외 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE point >= 500000
AND city != '서울';


-- Q17) 포인트가 400,000 이상인 '서울' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
FROM customer
WHERE point >= 400000 
AND city = '서울'
AND gender = 'M'

