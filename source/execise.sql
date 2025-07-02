-- study_project 데이터베이스 생성
CREATE DATABASE study_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 생성된 데이터베이스 사용
USE study_project;

-- 학생(student) 테이블 생성
CREATE TABLE student (
    student_no INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    student_age INT
);

-- 학생 정보 추가
INSERT INTO student (student_name, student_age)
VALUES ('홍길동', 20),
       ('김철수', 22),
       ('이영희', 21);