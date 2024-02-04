CREATE TABLE "User" (
  "user_id" SERIAL PRIMARY KEY,
  "username" VARCHAR,
  "email_type_id" INT,
  "genre_id" INT,
  "author_id" INT,
  FOREIGN KEY ("email_type_id") REFERENCES "EmailType"("email_type_id"),
  FOREIGN KEY ("genre_id") REFERENCES "Genre"("genre_id"),
  FOREIGN KEY ("author_id") REFERENCES "Author"("author_id")
);

CREATE TABLE "Author" (
  "author_id" SERIAL PRIMARY KEY,
  "author_first_name" VARCHAR,
  "author_last_name" VARCHAR
);

CREATE TABLE "Genre" (
  "genre_id" SERIAL PRIMARY KEY,
  "genre_name" VARCHAR
);

CREATE TABLE "EmailType" (
  "email_type_id" SERIAL PRIMARY KEY,
  "type" VARCHAR,
  "email" VARCHAR
);
