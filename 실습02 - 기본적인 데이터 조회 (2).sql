/*
실습02 - 기본적인 데이터 조회 (2)
*/

-- 데이터베이스 연결
USE MyShop2019;


-- Q18) '강릉' 또는 '원주' 지역 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.

SELECT customer_name, customer_id, gender, city, phone, point
	FROM customer
    WHERE city IN ('강릉', '원주');

-- Q19) 포인트가 400,000 이상, 500,000 이하인 고객의 이름, 아이디, 성별, 지역, 전화번호, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, point
	FROM customer 
    WHERE point BETWEEN 400000 AND 500000;


-- Q20) 1990년에 출생한 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
--      단, CASE 문을 사용해 성별은 '남자', '여자'로 표시되게 하세요.
SELECT customer_name, customer_id,
	CASE WHEN gender = 'M' THEN '남자'
		 WHEN gender = 'F' THEN '여자'
		 ELSE '' END AS gender, city, phone, birth_date, point
	FROM customer
    WHERE birth_date BETWEEN '1990-01-01' AND '1990-12-31';


-- Q21) 1990년에 출생한 여자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.

SELECT customer_name, customer_id, gender, city, phone, birth_date, point
	FROM customer
    WHERE YEAR(birth_date)= '1990'
    AND gender = 'F';

-- Q22) 1990년에 출생한 '대구' 또는 '경주' 지역 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
SELECT customer_name, customer_id, gender, city, phone, birth_date, point
	FROM customer
    WHERE YEAR(birth_date) = '1990'
    AND gender = 'M'
    AND city in ('대구', '경주');


-- Q23) 1990년에 출생한 남자 고객의 이름, 아이디, 성별, 지역, 전화번호, 생일, 포인트를 조회하세요.
--      단, 홍길동(gildong) 형태로 이름과 아이디를 묶어서 조회하세요.
SELECT CONCAT(customer_name, '(', customer_id,')') AS customer_name, gender, city, phone, birth_date, point
	FROM customer
    WHERE YEAR(birth_date) = '1990'
    AND gender = 'M';
    


-- Q24) 근무중인 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
 
SELECT employee_name, employee_id, gender, phone, hire_date
	FROM employee
    WHERE retire_date IS NULL;
 
-- Q25) 근무중인 남자 직원의 이름, 사원번호, 성별, 전화번호, 입사일를 조회하세요.
SELECT employee_name, employee_id, gender, phone, hire_date
	FROM employee
    WHERE retire_date IS NULL
    AND gender = 'M';


-- Q26) 퇴사한 직원의 이름, 사원번호, 성별, 전화번호, 입사일, 퇴사일를 조회하세요.
 
SELECT employee_name, employee_id, gender, phone, hire_date
	FROM employee
    WHERE retire_date IS NOT NULL;

-- Q27) 다음과 같이 조건에 따른 고객 등급이 표시되게 조회하세요.
--      단, 포인트가 0이거나 NULL이면 고객 등급이 NULL이 되게 하세요.
/*
1,000,000 이상 --> 'Platinum'
  600,000 이상 --> 'Gold'
  300,000 이상 --> 'Silver'
  100,000 이상 --> 'Bronze'
        0 초과 --> 'Family'
*/
SELECT customer_name, customer_id, gender, city, register_date, point,
	CASE WHEN point >= 1000000 THEN 'Platinum'
		 WHEN point >= 600000 THEN 'Gold'
         WHEN point >= 300000 THEN 'Silver'
         WHEN point >= 100000 THEN 'Bronze'
         WHEN point > 0 THEN 'Family'
         ELSE NULL END AS level
	FROM customer;
    
 
-- Q28) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 고객아이디를 기준으로 오름차순 정렬해서 조회하세요.
 
SELECT order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
	FROM order_header
    WHERE order_date BETWEEN '2019-01-01 00:00:00' AND '2019-01-07 23:59:59'
    ORDER BY customer_id ASC;
    
-- Q29) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 전체금액을 기준으로 내림차순 정렬해서 조회하세요.
SELECT order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
	FROM order_header
    WHERE order_date BETWEEN '2019-01-01 00:00:00' AND '2019-01-07 23:59:59'
    ORDER BY total_due DESC;


-- Q30) 2019-01-01 ~ 2019-01-07 기간 주문의 주문번호, 고객아이디, 사원번호, 주문일시, 소계, 배송비, 전체금액을 조회하세요.
--      단, 사원번호를 기준으로 오름차순, 같은 사원번호는 주문일시를 기준으로 내림차순 정렬해서 조회하세요.

SELECT order_id, customer_id, employee_id, order_date, sub_total, delivery_fee, total_due
	FROM order_header
    WHERE order_date BETWEEN '2019-01-01 00:00:00' AND '2019-01-07 23:59:59'
    ORDER BY employee_id ASC, order_date DESC;
