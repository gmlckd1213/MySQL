/*
실습03 - 데이터 집계
*/

-- 데이터베이스 연결
USE myshop2019;

    
-- Q01) 고객의 포인트 합을 조회하세요.
SELECT SUM(Point) AS tot_point
	FROM customer;

-- Q02) '서울' 지역 고객의 포인트 합을 조회하세요.
SELECT SUM(Point) AS tot_point
	FROM customer
    WHERE city = '서울';
    

-- Q03) '서울' 지역 고객의 수를 조회하세요.
SELECT COUNT(customer_name)
	FROM customer
	WHERE city = '서울';
    
-- Q04) '서울' 지역 고객의 포인트 합과 평균을 조회하세요.
SELECT SUM(Point) AS tot_point, AVG(Point) AS avg_point
	FROM customer
    WHERE city = '서울';
    

    
-- Q05) '서울' 지역 고객의 포인트 합, 평균, 최댓값, 최솟값을 조회하세요.
SELECT SUM(Point) AS tot_point, AVG(Point) AS avg_point, MAX(Point) AS max_point, MIN(Point) AS min_point
	FROM customer
    WHERE city = '서울';
    


-- Q06) 남녀별 고객의 수를 조회하세요.
SELECT gender, COUNT(*) AS customer_cnt
	FROM customer
    GROUP BY gender;


-- Q07) 지역별 고객의 수를 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS customer_cnt
	FROM customer
    GROUP BY city
    ORDER BY city ASC;
 
 
-- Q08) 지역별 고객의 수를 조회하세요.
--      단, 고객의 수가 10명 이상인 행만 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS customer_cnt
	FROM customer
    GROUP BY city
    HAVING COUNT(*) >=10
    ORDER BY city ASC;
    
    
-- Q09) 남녀별 포인트 합을 조회하세요.
SELECT gender, SUM(Point) AS tot_point
	FROM customer
    GROUP BY gender;


-- Q10) 지역별 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, SUM(Point) AS tot_point
	FROM customer
    GROUP BY city
    ORDER BY city ASC;


-- Q11) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합이 1,000,000 이상인 행만 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT city, SUM(Point) AS tot_point
	FROM customer
    GROUP BY city
    HAVING SUM(Point) >= 1000000
    ORDER BY tot_point DESC;
	
   
   
-- Q12) 지역별 포인트 합을 조회하세요.
--      단, 포인트 합을 기준으로 내림차순 정렬해서 조회하세요.
SELECT city, SUM(Point) as tot_point
	FROM customer
    GROUP BY city
    ORDER BY tot_point DESC;


-- Q13) 지역별 고객의 수, 포인트 합을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city, COUNT(*) AS customer_cnt, SUM(Point) as tot_point
	FROM customer
    GROUP BY city
    ORDER BY city ASC;


-- Q14) 지역별 포인트 합, 포인트 평균을 조회하세요.
--      단, 포인트가 NULL이 아닌 고객을 대상으로 하며, 지역 이름을 기준으로 오름차순 정렬해서 조회하세요.
SELECT city,  SUM(Point) as tot_point, AVG(Point) as avg_point
	FROM customer
    GROUP BY city
    Having tot_point IS NOT NULL
    ORDER BY city ASC;

SELECT city,  SUM(Point) as tot_point, AVG(Point) as avg_point
	FROM customer
    WHERE Point IS NOT NULL
    GROUP BY city
    ORDER BY city ASC;
    
-- Q15) '서울', '부산', '대구' 지역 고객의 지역별, 남녀별 포인트 합과 평균을 조회하세요.
--      단, 지역 이름을 기준으로 오름차순, 같은 지역은 성별을 기준으로 오름차순 정렬해서 조회하세요.
    


-- Q16) 2019년 1월 주문에 대하여 고객아이디별 전체금액 합을 조회하세요.



-- Q17) 다음 구문을 실행하여 YEAR, MONTH, DAY 함수 기능을 확인하고, 이후 쿼리문 작성 시 활용하세요.

SELECT order_date, YEAR(order_date) AS order_year, MONTH(order_date) AS order_month, 
       DAY(order_date) AS order_day, total_due
	FROM order_header;


-- Q18) 주문연도별 전체금액 압을 조회하세요.
SELECT YEAR(order_date) AS order_year, SUM(total_due) AS total_due
	FROM order_header
    GROUP BY YEAR(Order_date);


-- Q19) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합을 조회하세요.
SELECT YEAR(order_date) AS order_year,
		MONTH(order_date) AS order_month,
        SUM(total_due) AS total_due
	FROM order_header
    WHERE order_date BETWEEN '2019-01-01' AND '2019-06-30'
    GROUP BY YEAR(order_date), MONTH(order_date);


-- Q20) 2019.01 ~ 2019.06 기간 주문에 대하여 주문연도별, 주문월별 전체금액 합과 평균을 조회하세요.
SELECT YEAR(order_date) AS order_year,
		MONTH(order_date) AS order_month,
        SUM(total_due) AS total_due,
        AVG(total_due) AS avg_total_due
	FROM order_header
    WHERE order_date BETWEEN '2019-01-01' AND '2019-06-30'
    GROUP BY YEAR(order_date), MONTH(order_date);


