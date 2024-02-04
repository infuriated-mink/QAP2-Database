CREATE TABLE "Cleaning_Type" (
  "id" SERIAL PRIMARY KEY,
  "cleaning_name" VARCHAR
);

CREATE TABLE "Location" (
  "location_id" SERIAL PRIMARY KEY,
  "street_address" VARCHAR,
  "province" VARCHAR,
  "postal_code" VARCHAR,
  "country" VARCHAR
);

CREATE TABLE "Users" (
  "user_id" SERIAL PRIMARY KEY,
  "user_first_name" VARCHAR,
  "user_last_name" VARCHAR,
  "user_email" VARCHAR,
  "user_password" VARCHAR,
  "user_type_id" VARCHAR,
  "phone_no" VARCHAR
);

CREATE TABLE "User_Location" (
  "user_id" INT REFERENCES "Users"("user_id"),
  "location_id" INT REFERENCES "Location"("location_id"),
  PRIMARY KEY ("user_id", "location_id")
);

CREATE TABLE "Conversation" (
  "conversation_id" SERIAL PRIMARY KEY,
  "creation_date" TIMESTAMP,
  "update_date" TIMESTAMP,
  "last_message_id" INT REFERENCES "Message"("message_id"),
  "first_user_id" INT REFERENCES "Users"("user_id"),
  "second_user_id" INT REFERENCES "Users"("user_id")
);

CREATE TABLE "Cleaner" (
  "cleaner_id" SERIAL PRIMARY KEY,
  "cleaner_first_name" VARCHAR,
  "cleaner_last_name" VARCHAR,
  "cleaner_email" VARCHAR,
  "cleaner_password" VARCHAR,
  "phone_no" VARCHAR
);

CREATE TABLE "Cleaner_User_Conversation" (
  "user_conversation_id" SERIAL PRIMARY KEY,
  "user_id" INT REFERENCES "Users"("user_id"),
  "cleaner_id" INT REFERENCES "Cleaner"("cleaner_id"),
  "conversation_id" INT REFERENCES "Conversation"("conversation_id")
);

CREATE TABLE "Message" (
  "message_id" SERIAL PRIMARY KEY,
  "message_data_id" INT REFERENCES "MessageData"("message_data_id"),
  "creation_date" TIMESTAMP,
  "status" VARCHAR,
  "read_time" TIMESTAMP,
  "sender" INT REFERENCES "Users"("user_id"),
  "receiver" INT REFERENCES "Users"("user_id"),
  "conversation_id" INT REFERENCES "Conversation"("conversation_id")
);

CREATE TABLE "Rating" (
  "rating_id" SERIAL PRIMARY KEY,
  "photo" BYTEA,
  "comment" VARCHAR,
  "rating_value" VARCHAR
);

CREATE TABLE "User_Booking_Status" (
  "user_booking_status_id" SERIAL PRIMARY KEY,
  "status_name" VARCHAR,
  "is_booking_confirmed" BOOLEAN,
  "is_booking_cancelled" BOOLEAN,
  "is_cleaning_complete" BOOLEAN
);

CREATE TABLE "Message_Data" (
  "message_data_id" SERIAL PRIMARY KEY,
  "text" VARCHAR,
  "image" BYTEA,
  "voice" BYTEA,
  "video" BYTEA,
  "message_id" INT REFERENCES "Message"("message_id")
);

CREATE TABLE "Booking" (
  "booking_id" SERIAL PRIMARY KEY,
  "user_id" INT REFERENCES "Users"("user_id"),
  "cleaner_id" INT REFERENCES "Cleaner"("cleaner_id"),
  "booking_date" TIMESTAMP,
  "booking_time" TIMESTAMP,
  "cleaning_time" TIMESTAMP,
  "cleaning_date" TIMESTAMP,
  "cleaning_type_id" INT REFERENCES "Cleaning_Type"("id"),
  "rating_id" INT REFERENCES "Rating"("rating_id"),
  "user_booking_status_id" INT REFERENCES "User_Booking_Status"("user_booking_status_id")
);

CREATE TABLE "Cleaner_Location" (
  "cleaner_id" INT REFERENCES "Cleaner"("cleaner_id"),
  "location_id" INT REFERENCES "Location"("location_id"),
  PRIMARY KEY ("cleaner_id", "location_id")
);
