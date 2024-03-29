CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    user_name VARCHAR(255) UNIQUE,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    user_pass VARCHAR(30),
    Bdate DATE,
    Age INT(2),
    phone INT(11),
    zip_code INT,
    city VARCHAR(255),
    country VARCHAR(255)
);

CREATE TABLE Car (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    plate_id VARCHAR(11) UNIQUE,
    year INT(4),
    model VARCHAR(255),
    color ENUM('BLACK','WHITE','RED','SILVER','BLUE','MIDNIGHT PURPLE','ORANGE','GREEN','DARK PINK'),
    `status` ENUM('ACTIVE','RENTED','OUT OF SERVICE')
);

CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    car_id INT,
    payment_id INT,
    pick_up_date DATE,
    return_date DATE,
    reservation_date DATE,
    reservation_status ENUM('RESERVED', 'PICKED UP', 'RETURNED') DEFAULT 'RESERVED',
    payment_status ENUM('PENDING', 'COMPLETED') DEFAULT 'PENDING',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT,
    amount_of_money DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);
