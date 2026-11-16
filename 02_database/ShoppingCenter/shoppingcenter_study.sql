CREATE DATABASE shoppingenter;

CREATE Table products
(
    product_id  SERIAL          PRIMARY KEY,
    name        VARCHAR(30)     NOT NULL,
    price       INT(20)         NOT NULL,
    quantity    SMALLINT        NOT NULL,
    category    VARCHAR(30)     NOT NULL,
    description VARCHAR(200)    NOT NULL
);
CREATE Table categories
(
    category_id     SERIAL          PRIMARY KEY,
    category_name   VARCHAR(20)     NOT NULL,
    description     VARCHAR(200)    NOT NULL
);

CREATE TABLE carts
(
    cart_id       SERIAL      PRIMARY KEY,
    user_id       INT         NOT NULL,
    product_id    VARCHAR(30) NOT NULL REFERENCES products (product_id),
    quantity      SMALLINT(10) NOT NULL
);