DROP TABLE products;
DROP TABLE farms;


CREATE TABLE farms
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255),
  phone_num VARCHAR(255)

);

CREATE TABLE products
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  description VARCHAR(255),
  stock INT4,
  cost FLOAT,
  price FLOAT,
  Farm_id INT8 references farms(id)
);
