-- Question 1&2:
CREATE TABLE Location (
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR,
  unit_number VARCHAR,
  postal_code VARCHAR,
  city_id VARCHAR,
  province_id VARCHAR
);

CREATE TABLE University (
  university_id SERIAL PRIMARY KEY,
  university_name VARCHAR,
  university_head VARCHAR,
  university_email VARCHAR,
  location INT REFERENCES Location(location_id)
);

CREATE TABLE Student (
  student_id SERIAL PRIMARY KEY,
  student_first_name VARCHAR,
  student_last_name VARCHAR,
  student_email VARCHAR,
  university_id INT REFERENCES University(university_id)
);

CREATE TABLE Department (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR,
  department_head VARCHAR,
  department_email VARCHAR,
  university_id INT REFERENCES University(university_id)
);

CREATE TABLE StudentDepartment (
  student_id INT REFERENCES Student(student_id),
  department_id INT REFERENCES Department(department_id),
  PRIMARY KEY (student_id, department_id)
);
-- Question 3:
CREATE TABLE Artist (
  artist_id SERIAL PRIMARY KEY,
  artist_first_name VARCHAR,
  artist_last_name VARCHAR,
  artist_email VARCHAR,
  artist_phone VARCHAR,
  location_id INT REFERENCES Location(location_id)
);

CREATE TABLE Gallery (
  gallery_id SERIAL PRIMARY KEY,
  gallery_name VARCHAR,
  location_id INT REFERENCES Location(location_id)
);

CREATE TABLE WorkofArt (
  artwork_id SERIAL PRIMARY KEY,
  artwork_title VARCHAR,
  artwork_medium VARCHAR,
  gallery_id INT REFERENCES Gallery(gallery_id),
  artist_id INT REFERENCES Artist(artist_id)
);

-- Question 4:
CREATE TABLE Owner (
  owner_id SERIAL PRIMARY KEY,
  owner_first_name VARCHAR,
  owner_last_name VARCHAR,
  license_no VARCHAR,
  license_exp VARCHAR,
  location_id INT REFERENCES Location(location_id)
);

CREATE TABLE Automobile (
  auto_id SERIAL PRIMARY KEY,
  license_plate VARCHAR,
  make VARCHAR,
  model VARCHAR,
  year VARCHAR,
  owner_id INT REFERENCES Owner(owner_id),
  branch_id INT REFERENCES MotorVehicleDepartment(branch_id)
);

CREATE TABLE OwnerAutomobile (
  owner_id INT REFERENCES Owner(owner_id),
  auto_id INT REFERENCES Automobile(auto_id),
  PRIMARY KEY (owner_id, auto_id)
);

CREATE TABLE MotorVehicleDepartment (
  branch_id SERIAL PRIMARY KEY,
  location_id INT REFERENCES Location(location_id),
  phone_number VARCHAR
);

-- Question 5:
CREATE TABLE Toppings (
  topping_id SERIAL PRIMARY KEY,
  topping_name VARCHAR
);

CREATE TABLE Restaurant (
  restaurant_id SERIAL PRIMARY KEY,
  phone_no VARCHAR
);

CREATE TABLE Pizza (
  pizza_id SERIAL PRIMARY KEY,
  pizza_name VARCHAR,
  pizza_description VARCHAR,
  pizza_type VARCHAR,
  restaurant_id INT REFERENCES Restaurant(restaurant_id)
);

CREATE TABLE PizzaToppings (
  pizza_id INT REFERENCES Pizza(pizza_id),
  toppings_id INT REFERENCES Toppings(topping_id),
  PRIMARY KEY (pizza_id, toppings_id)
);


-- Question 6:
CREATE TABLE FurnitureType (
  type_id SERIAL PRIMARY KEY,
  type_description VARCHAR,
  province VARCHAR,
  postal_code VARCHAR
);

CREATE TABLE HouseHoldFurniture (
  furniture_id SERIAL PRIMARY KEY,
  furniture_name VARCHAR,
  type_id INT REFERENCES FurnitureType(type_id),
  location_id INT REFERENCES Location(location_id),
  furniture_description VARCHAR
);

CREATE TABLE LocationFurniture (
  location_id INT REFERENCES Location(location_id),
  furniture_id INT REFERENCES HouseHoldFurniture(furniture_id),
  PRIMARY KEY (location_id, furniture_id)
);


