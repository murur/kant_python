CREATE DATABASE shoppingenter;

CREATE Table categories
(
    category_id     SERIAL          PRIMARY KEY,
    category_name   VARCHAR(20)     NOT NULL,
    description     TEXT            NOT NULL
);

CREATE Table products
(
    product_id  SERIAL          PRIMARY KEY,
    name        VARCHAR(30)     NOT NULL,
    price       NUMERIC(12, 2)  NOT NULL DEFAULT 0 CHECK(PRICE >= 0),
    stock_pty   INT             NOT NULL DEFAULT 0 CHECK(stock_pty >= 0),
    category_id INT             NOT NULL REFERENCES cartegory_id (cartegory_id),
    description TEXT            NOT NULL
);



DROP TABLE IF EXISTS product;

CREATE TABLE carts
(
    cart_id       SERIAL      PRIMARY KEY,
    user_id       INT         NOT NULL,
    product_id    INT         NOT NULL REFERENCES products (product_id),
    quantity      INT         NOT NULL DEFAULT
);