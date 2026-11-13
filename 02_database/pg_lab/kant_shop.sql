-- 1. 데이터베이스 생성
DROP DATABASE IF EXISTS kant_shop;

CREATE DATABASE kant_shop;

-- 2. 새로만든 데이터 베이스 접속 (특정 DB를 사용하겠다 라는 의미)
\c kant_shop

-- 3. 상품 테이블 생성
CREATE TABLE product
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    stock INT NOT NULL
);

-- 4. 상품 초기 데이터 입력
INSERT INTO product (name, price, stock) VALUES
('무선 키보드', 35000, 120),
('게이밍 마우스', 28000, 85),
('27인치 모니터', 259000, 15),
('USB-C 허브', 19900, 200),
('노트북 거치대', 24000, 7);