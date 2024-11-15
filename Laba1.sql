CREATE TABLE "book"(
    "id" BIGINT NOT NULL,
    "book_name" BIGINT NOT NULL,
    "edition" BIGINT NOT NULL,
    "edition_year" DATE NOT NULL,
    "place_id" BIGINT NOT NULL
);
ALTER TABLE
    "book" ADD PRIMARY KEY("id");
CREATE INDEX "book_place_id_index" ON
    "book"("place_id");
CREATE TABLE "publisher"(
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "publisher" ADD PRIMARY KEY("id");
CREATE TABLE "publisher_book"(
    "publisher_id" BIGINT NOT NULL,
    "book_id" BIGINT NOT NULL
);
CREATE INDEX "publisher_book_publisher_id_index" ON
    "publisher_book"("publisher_id");
CREATE INDEX "publisher_book_book_id_index" ON
    "publisher_book"("book_id");
CREATE TABLE "book_issuance"(
    "book_id" BIGINT NOT NULL,
    "reader_id" BIGINT NOT NULL,
    "date_issuance" DATE NOT NULL,
    "expected_return_date" DATE NOT NULL,
    "return_date" DATE NOT NULL
);
CREATE INDEX "book_issuance_book_id_index" ON
    "book_issuance"("book_id");
CREATE INDEX "book_issuance_reader_id_index" ON
    "book_issuance"("reader_id");
CREATE TABLE "Author"(
    "id" BIGINT NOT NULL,
    "surname" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Author" ADD PRIMARY KEY("id");
CREATE TABLE "author_book"(
    "author_id" BIGINT NOT NULL,
    "book_id" BIGINT NOT NULL
);
CREATE INDEX "author_book_author_id_index" ON
    "author_book"("author_id");
CREATE INDEX "author_book_book_id_index" ON
    "author_book"("book_id");
CREATE TABLE "biblio_place"(
    "id" BIGINT NOT NULL,
    "sequence_number" BIGINT NOT NULL,
    "row" BIGINT NOT NULL
);
ALTER TABLE
    "biblio_place" ADD PRIMARY KEY("id");
CREATE TABLE "reader"(
    "id" BIGINT NOT NULL,
    "surname" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "birth date" DATE NOT NULL,
    "sex" BOOLEAN NOT NULL,
    "education" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "reader" ADD PRIMARY KEY("id");
ALTER TABLE
    "publisher_book" ADD CONSTRAINT "publisher_book_publisher_id_foreign" FOREIGN KEY("publisher_id") REFERENCES "publisher"("id");
ALTER TABLE
    "book_issuance" ADD CONSTRAINT "book_issuance_reader_id_foreign" FOREIGN KEY("reader_id") REFERENCES "reader"("id");
ALTER TABLE
    "author_book" ADD CONSTRAINT "author_book_author_id_foreign" FOREIGN KEY("author_id") REFERENCES "Author"("id");
ALTER TABLE
    "author_book" ADD CONSTRAINT "author_book_book_id_foreign" FOREIGN KEY("book_id") REFERENCES "book"("id");
ALTER TABLE
    "publisher_book" ADD CONSTRAINT "publisher_book_book_id_foreign" FOREIGN KEY("book_id") REFERENCES "book"("id");
ALTER TABLE
    "book_issuance" ADD CONSTRAINT "book_issuance_book_id_foreign" FOREIGN KEY("book_id") REFERENCES "book"("id");
ALTER TABLE
    "book" ADD CONSTRAINT "book_place_id_foreign" FOREIGN KEY("place_id") REFERENCES "biblio_place"("id");