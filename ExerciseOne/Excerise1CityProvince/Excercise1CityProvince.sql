-- Create the Provinces table
CREATE TABLE Provinces (
    Province_ID SERIAL NOT NULL, 
    Province_Name VARCHAR(255) NOT NULL,
    PRIMARY KEY (Province_ID)
);

-- Create the Cities table
CREATE TABLE Cities (
    City_ID SERIAL NOT NULL,
    City_Name VARCHAR(255) NOT NULL,
    Province_ID INT NOT NULL,
    PRIMARY KEY (City_ID),
    FOREIGN KEY (Province_ID) REFERENCES Provinces(Province_ID) ON DELETE CASCADE
);
