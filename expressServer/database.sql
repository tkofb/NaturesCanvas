CREATE DATABASE IrrigationClients

CREATE TABLE question (
   "id" SERIAL NOT NULL
   "name" VARCHAR(100)   NOT NULL,
   "phone_number" VARCHAR(15) ,
   "email" VARCHAR(100),
   "subject" TEXT   NOT NULL,
   "description" TEXT   NOT NULL
);


CREATE TABLE request (
   "service_id" SERIAL   NOT NULL,
   "customer_id" int   NOT NULL,
   "customer_status" VARCHAR(100)   NOT NULL,
   "request_date" date   NOT NULL,
   CONSTRAINT "pk_ServiceRequest" PRIMARY KEY (
       "service_id"
    )
);


CREATE TABLE service (
   "service_id" int   NOT NULL,
   "service" VARCHAR(200)   NOT NULL
);


CREATE TABLE address (
   "customer_id" int   NOT NULL,
   "street_1" VARCHAR(100)   NOT NULL,
   "street_2" VARCHAR(100),
   "city" VARCHAR(100)   NOT NULL,
   "state" VARCHAR(100)   NOT NULL,
   "zip_code" int   NOT NULL
);


CREATE TABLE customer (
   "customer_id" SERIAL NOT NULL,
   "first_name" VARCHAR(100)   NOT NULL,
   "last_name" VARCHAR(100)   NOT NULL,
   "email" VARCHAR(100),
   "phone_number" VARCHAR(15),
   CONSTRAINT "pk_Customer" PRIMARY KEY (
       "customer_id"
    )
);


CREATE TABLE coupon (
   "service_id" int   NOT NULL,
   "coupon" int
);


CREATE TABLE origin (
   "customer_id" int   NOT NULL,
   "found_us_from" VARCHAR(100)
);


ALTER TABLE request ADD CONSTRAINT "fk_request_customer_id" FOREIGN KEY("customer_id")
REFERENCES customer ("customer_id");


ALTER TABLE "service" ADD CONSTRAINT "fk_service_service_id" FOREIGN KEY("service_id")
REFERENCES request ("service_id");


ALTER TABLE "address" ADD CONSTRAINT "fk_address_customer_id" FOREIGN KEY("customer_id")
REFERENCES customer ("customer_id");


ALTER TABLE coupon ADD CONSTRAINT "fk_coupon_service_id" FOREIGN KEY("service_id")
REFERENCES request ("service_id");


ALTER TABLE origin ADD CONSTRAINT "fk_origin_customer_id" FOREIGN KEY("customer_id")
REFERENCES customer ("customer_id");