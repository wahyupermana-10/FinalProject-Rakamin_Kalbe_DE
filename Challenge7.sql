CREATE DATABASE KALBE1;
USE KALBE1;

-- Membuat tabel dimensi

-- Tabel Dimensi Tanggal
CREATE TABLE DateDim (
    DateKey INT PRIMARY KEY,
    Date DATE NOT NULL,
    Month INT NOT NULL,
    Quarter INT NOT NULL,
    Year INT NOT NULL
);

-- Tabel Dimensi Produk
CREATE TABLE ProductDim (
    ProductKey INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    ProductCategory VARCHAR(255) NOT NULL,
    ProductType VARCHAR(255) NOT NULL,
    Manufacturer VARCHAR(255) NOT NULL
);

-- Tabel Dimensi Pelanggan
CREATE TABLE CustomerDim (
    CustomerKey INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    CustomerType VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(255)
);

-- Tabel Dimensi Lokasi
CREATE TABLE LocationDim (
    LocationKey INT PRIMARY KEY,
    City VARCHAR(255) NOT NULL,
    State VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    PostalCode VARCHAR(10) NOT NULL
);

-- Tabel Dimensi Karyawan
CREATE TABLE EmployeeDim (
    EmployeeKey INT PRIMARY KEY,
    EmployeeName VARCHAR(255) NOT NULL,
    Role VARCHAR(255) NOT NULL,
    Department VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(15)
);

-- Membuat tabel fakta

CREATE TABLE Sales (
    FactID INT PRIMARY KEY AUTO_INCREMENT,
    DateKey INT,
    ProductKey INT,
    CustomerKey INT,
    LocationKey INT,
    EmployeeKey INT,
    TotalSales DECIMAL(10, 2) NOT NULL,
    QuantitySold INT NOT NULL,
    TotalRevenue DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (DateKey) REFERENCES DateDim(DateKey),
    FOREIGN KEY (ProductKey) REFERENCES ProductDim(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES CustomerDim(CustomerKey),
    FOREIGN KEY (LocationKey) REFERENCES LocationDim(LocationKey),
    FOREIGN KEY (EmployeeKey) REFERENCES EmployeeDim(EmployeeKey)
);
