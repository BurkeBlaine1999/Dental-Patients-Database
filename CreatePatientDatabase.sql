Drop database if exists PatientsDB;
Show databases;
create database PatientsDB CHARACTER SET utf8 COLLATE UTF8_GENERAL_CI ;



Use PatientsDB;
Show tables;
Drop table if exists PatientDetails;


create table PatientDetails (
  patientNo tinyint unsigned NOT NULL auto_increment ,  
  firstName varchar(45) NOT NULL, 
  lastName varchar(45) NOT NULL,
  DOB date NOT NULL,
  email varchar(45) NOT NULL,
  billAddress varchar(45) NOT NULL,
  appointmentNo tinyint unsigned NOT NULL,
  specializeIn ENUM ('Orthadontist','Periodontist','Prosthodontist') NOT NULL,
  billId tinyint unsigned NOT NULL,
  patientImage varchar(20) DEFAULT NULL,   
  patientXray varchar(20) DEFAULT NULL,   
  PRIMARY KEY (patientNo),
  FOREIGN KEY (appointmentNo) REFERENCES appointment(appointmentNo),
  FOREIGN KEY (billId) REFERENCES bill(billId)
  );
   
show tables;
select * from PatientDetails;
Insert into PatientDetails values (1, 'Blaine', 'Burke','1999-11-02', 'Blaine@gmail.com','Monivea Galway',1,'Orthadontist',1,'/patients/patient1.jpeg','/patients/patient1.jpeg'),(2, 'Aaron', 'Moran','1998-10-24','Aaron@gmail.com','Lough Atalia Galway',2,'Periodontist',2,'/patients/patient2.jpeg','/patients/patient2.jpeg'),(3, 'Ciaran', 'Quinn','1998-7-30','Ciaran@gmail.com','Knocknacarra Galway',3,'Orthadontist',3,'/patients/patient3.jpeg','/patients/patient3.jpeg'),(4, 'John', 'Doe','1969-1-1','John@gmail.com','Welpark Galway',4,'Orthadontist',4,'/patients/patient4.jpeg','/patients/patient4.jpeg');



Drop table if exists appointment;
Show databases;
Use PatientsDB;

create table appointment(
  appointmentNo tinyint unsigned NOT NULL auto_increment,
  patientNo tinyint unsigned NOT NULL,
  appointmentDate date NOT NULL,
  specialistNo tinyint unsigned NOT NULL ,
  primary key (appointmentNo),
  FOREIGN KEY (patientNo) REFERENCES PatientDetails(patientNo),
  FOREIGN KEY (specialistNo) REFERENCES specialists(specialistNo)
);

describe appointment;
select * from appointment;
INSERT INTO appointment (appointmentNo, patientNo, appointmentDate, specialistNo) VALUES(1,1,'2020-03-22',1),(2,2,'2020-03-23',2),(3,3,'2020-03-24',3),(4,4,'2020-03-25',2);



Drop table if exists payment;
Show databases;
Use PatientsDB;

create table payment(
  paymentId tinyint unsigned NOT NULL auto_increment,
  billId tinyint unsigned NOT NULL,
  method ENUM('Cash','Cheque','Mastercard','Visa','Installments'),
  recievedBy ENUM('Post','handedIn','Upfront'),
  primary key (paymentId),
  FOREIGN KEY (billId) REFERENCES bill(billId)  
);

describe payment;
select * from payment;
INSERT INTO payment (paymentId, billId, method, recievedBy) VALUES(1,1,'Cash','Post'),(2,2,'Mastercard','Upfront'),(3,3,'Visa','handedIn'),(4,4,'Cheque','Post');



Drop table if exists bill;
Show databases;
Use PatientsDB;

create table bill(
  billId tinyint unsigned NOT NULL auto_increment,
  patientNo tinyint unsigned NOT NULL,
  paymentId tinyint unsigned NOT NULL,
  cost double NOT NULL,
  primary key (billId),
  FOREIGN KEY (patientNo) REFERENCES PatientDetails(patientNo),  
  FOREIGN KEY (paymentId) REFERENCES payment(paymentId) 
);

describe bill;
select * from bill;
INSERT INTO bill (billId, patientNo, paymentId, cost) VALUES(1,1,1,100.99),(2,2,2,50.20),(3,3,3,42.40),(4,4,4,132.90);



Drop table if exists specialist;
Show databases;
Use PatientsDB;

create table specialist(
 
  specialistNo tinyint unsigned NOT NULL auto_increment,
  specializeIn ENUM('Orthadontist','Periodontist','Prosthodontist') NOT NULL,
  specialistFirstName varchar(45),
  specialistLastName varchar(45),
  primary key (specialistNo) 
);

describe specialist;
select * from specialist;
INSERT INTO specialist (specialistNo, specializeIn, specialistFirstName, specialistLastName) VALUES(1,'Orthadontist','Jane','Doe'),(2,'Periodontist','Mary','Carrol'),(3,'Prosthodontist','Thomas','Kenny');



Drop table if exists treatment;
Show databases;
Use PatientsDB;

create table treatment(
  treatmentNo tinyint unsigned NOT NULL auto_increment,
  specialistNo tinyint unsigned NOT NULL,
  treatmentDetails varchar(200),
  status ENUM('Complete','onGoing','NotStarted'),
  primary key (treatmentNo),
  FOREIGN KEY (specialistNo) REFERENCES specialist(specialistNo) 
);

describe treatment;
select * from treatment;
INSERT INTO treatment (treatmentNo, specialistNo, treatmentDetails, status) VALUES(1,1,'removed Tooth','Complete'),(2,2,'Cleaned Teeth','COMPLETE'),(3,3,'fake Teeth','onGoing');

show warnings;