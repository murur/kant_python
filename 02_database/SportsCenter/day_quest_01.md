## 상품용 데이터베이스

- 상품용 데이터베이스 생성
- 해당 데이터베이스 접속

## 상품 테이블 설계

- 적절한 PK와 제약 조건을 설정

- 상품 ID
- 상품명
- 가격
- 재고량
- 카테고리
- 설명

## 카테고리 테이블 설계

- 적절한 PK와 제약 조건을 설정

- 카테고리 ID
- 카테고리명
- 설명

## 상품 장바구니 테이블 설계

- 적절한 PK와 FK(Foreign Key) 제약 조건을 설정

- 장바구니 ID
- 사용자 ID
- 상품 ID
- 수량

## 설계 예시

### 데이터베이스 생성

```sql
-- 데이터베이스 생성
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;

-- 데이터베이스 접속
\c shop
```

### 카테코리 테이블 생성
- FK로 참조해야 하기에 먼저 생성해야 한다.

```sql
CREATE TABLE categories  
(  
    category_id         SERIAL PRIMARY KEY ,  
    category_name       VARCHAR(100) NOT NULL UNIQUE ,  
    description         TEXT  
);
```

### 상품 테이블 생성

```sql
DROP TABLE IF EXISTS product;

CREATE TABLE products  
(  
    product_id      SERIAL PRIMARY KEY ,  
    product_name    VARCHAR(200) NOT NULL ,  
    price           NUMERIC(12, 2) NOT NULL DEFAULT 0 CHECK(price >= 0),  
    stock_qty       INT NOT NULL DEFAULT 0 CHECK ( stock_qty >= 0 ),  
    category_id     INT NOT NULL REFERENCES categories (category_id),  
    description     TEXT  
);
```

### CONSTRAINT 활용한 제약 조건 설정

- `FOREIGN KEY`와 `REFERENCES`를 모두 사용해야 합니다.
- `FOREIGN KEY`는 현재 테이블에서 외래 키로 사용할 컬럼을 지정합니다.
- `REFERENCES`는 참조할 테이블과 컬럼을 지정합니다.
- `CONSTRAINT`를 사용하면 제약조건에 이름을 부여할 수 있습니다.

```sql
CREATE TABLE products  
(  
    product_id      SERIAL PRIMARY KEY ,  
    product_name    VARCHAR(200) NOT NULL ,  
    price           NUMERIC(12, 2) NOT NULL DEFAULT 0 CHECK(price >= 0),  
    stock_qty       INT NOT NULL DEFAULT 0 CHECK ( stock_qty >= 0 ),  
    category_id     INT NOT NULL,  
    description     TEXT,  
  
    CONSTRAINT fk_product_category  
        FOREIGN KEY (category_id)  
        REFERENCES categories (category_id)  
);
```
### 여러개의 CONSTRAINT 설정

```sql
CREATE TABLE products  
(  
    product_id      SERIAL PRIMARY KEY ,  
    product_name    VARCHAR(200) NOT NULL ,  
    price           NUMERIC(12, 2) NOT NULL DEFAULT 0 ,  
    stock_qty       INT NOT NULL DEFAULT 0 ,  
    category_id     INT NOT NULL,  
    description     TEXT,  
  
	-- 외래키 설정
    CONSTRAINT fk_product_category  
        FOREIGN KEY (category_id)  
        REFERENCES categories (category_id),  
  
	-- 제약조건 (가격 >= 0)
    CONSTRAINT chk_products_price  
        CHECK ( price >= 0 ),  
  
	-- 제약조건 (재고수량 >= 0)
    CONSTRAINT chk_products_stock  
        CHECK ( stock_qty >= 0 )  
);
```

## 장바구니 테이블

```sql
CREATE TABLE carts   
(  
    cart_id     SERIAL PRIMARY KEY,  
    user_id     INT NOT NULL,  
    product_id  INT NOT NULL,  
    qty         INT NOT NULL DEFAULT 1 CHECK (qty > 0),  
      
    CONSTRAINT fk_carts_product  
	   FOREIGN KEY (product_id)  
	   REFERENCES products(product_id),  
      
    CONSTRAINT uq_carts_user_product  
       UNIQUE (user_id, product_id)  
);
```