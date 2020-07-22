CREATE TABLE "card_holder" (
    "cardholder_id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Card_holder" PRIMARY KEY (
        "cardholder_id"
     )
);

CREATE TABLE "credit_card" (
    "creditcard_num" BIGINT   NOT NULL,
    "cardholder_id" INT   NOT NULL,
    CONSTRAINT "pk_Credit_card" PRIMARY KEY (
        "creditcard_num"
     )
);

CREATE TABLE "merchant" (
    "merchant_id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "merchant_cat_id" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "merchant_category" (
    "merchant_cat_id" INT   NOT NULL,
    "category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Merchant_category" PRIMARY KEY (
        "merchant_cat_id"
     )
);

CREATE TABLE "transaction" (
    "transaction_id" INT   NOT NULL,
    "date" timestamp   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "creditcard_num" BIGINT   NOT NULL,
    "merchant_id" INT   NOT NULL,
    CONSTRAINT "pk_Transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("cardholder_id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_merchant_cat_id" FOREIGN KEY("merchant_cat_id")
REFERENCES "merchant_category" ("merchant_cat_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_creditcard_num" FOREIGN KEY("creditcard_num")
REFERENCES "credit_card" ("creditcard_num");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchant" ("merchant_id");

