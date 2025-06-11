/*
3. 데이터 필터링하기
3.1 데이터 필터링이란
*/
-- 무엇? 많은 데이터들 중에 원하는 데이터만 골라내는 작업
-- 주로 WHERE 절을 통해 특정 데이터를 추출

-- 예를 들어
-- (a) SELECT문: 데이터 조회
-- SELECT 컬럼명1, 컬럼명2, ...
-- FROM 테이블명
-- WHERE 조건;

-- (b) UPDATE문: 데이터 수정
-- UPDATE 테이블명
-- SET 컬럼명 = 입력값
-- WHERE 조건;

-- (c) DELETE문: 데이터 삭제
-- DELETE FORM 테이블명
-- WHERE 조건;

-- 실습 데이터 준비
-- 2장에서 만든 맵도날드 DB를 활용
-- DB 진입
USE mapdonalds;

-- burger 테이블 조회
SELECT * FROM burgers;

-- burgers 테이블 생성
CREATE TABLE burgers (
	id INTEGER, 		  -- 아이디(정수형 숫자)
	name VARCHAR(50), -- 이름(문자형: 최대 50자)
	price INTEGER, 		-- 가격(정수형 숫자)
	gram INTEGER, 		-- 그램(정수형 숫자)
	kcal INTEGER, 		-- 열량(정수형 숫자)
	protein INTEGER, 	-- 단백질량(정수형 숫자)
	PRIMARY KEY (id) 	-- 기본키 지정: id
);

-- burgers 데이터 삽입
INSERT INTO burgers (id, name, price, gram, kcal, protein)
VALUES
	(1, '빅맨', 5300, 223, 583, 27),
	(2, '베이컨 틈메이러 디럭스', 6200, 242, 545, 27),
	(3, '맨스파이시 상해 버거', 5300, 235, 494, 20),
	(4, '슈비두밥 버거', 6200, 269, 563, 21),
	(5, '더블 쿼터파운드 치즈', 7700, 275, 770, 50);

-- 모든 버거 조회
SELECT*
FROM burgers;

-- 1) 비교 연산자
-- 두 값을 비교하는 연산 기호
-- WHERE 절에 사용하여 특정 데이터로 필터링 가능
-- 종류 : = , !=, >, >=, <, <=

-- 가격이 5500원 보다 싼 버거 찾기
SELECT *
FROM burgers
WHERE price<5500;
-- 가격이 5500원 보다 비싼 버거 찾기
SELECT *
FROM burgers
WHERE price>5500;

-- 단백질량이 25g 보다 적은 버거 찾기
SELECT *
FROM burgers
WHERE protein<25;

--2) 논리 연산자
-- 조건을 조합하거나 반전하여 새 조건을 만듦
-- 종류 : AND , OR , NOT
-- 조건A AND 조건B : 조건 A와 조건 B를 동시에 만족하는 데이터 필터링(교집합)
-- 조건A OR 조건B : 조건 A와 조건 B를 하나라도 만족하는 데이터 필터링(합집합)
-- NOT 조건A : 조건 A를 만족하지 않는 데이터 필터링(여집합)

-- TRUE/ FALSE의 논리 연산
-- TRUE(참: 1), FALSE(거짓:0)


-- AND 연산 : 둘 다 참이어야 참

SELECT TRUE AND TRUE; -- 1
SELECT TRUE AND FALSE; -- 0
SELECT FALSE AND TRUE; -- 0
SELECT FALSE AND FALSE; -- 0

-- OR 연산 : 둘 중 하나만 참이면 참

SELECT TRUE  OR TRUE; -- 1
SELECT TRUE  OR FALSE; -- 1
SELECT FALSE OR TRUE; -- 1
SELECT FALSE OR FALSE;-- 0

-- 5500원 보다 싸고, 동시에 단백질량이 25g 보다 많은 버거
  SELECT *
  FROM burgers
  WHERE price<5500 AND protein>25;
-- 5500원 보다 싸거나, 단백질량이 25g 보다 많은 버거
  SELECT *
  FROM burgers
  WHERE price<5500 OR protein>25;
-- 단백질량이 25g 보다 많지 않은 버거

  SELECT *
  FROM burgers
  WHERE NOT protein>25;