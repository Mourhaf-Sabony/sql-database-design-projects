Create database Simple_Clinic;

USE Simple_Clinic;

Create table Persons (
	PersonID int Primary key,
	Name nvarchar(100),
	DateOfBirth date,
	Gender nvarchar(1),
	Address nvarchar(200)
);

Create table Emails(
	EmailID int primary key,
	Email nvarchar(100),
	PersonID int foreign key References Persons(PersonID)
);

Create table Phones (
	PhoneID int Primary key,
	Phone nvarchar(20),
	PersonID int Foreign key References Persons(PersonID)
);

Create table Doctors(
	DoctorID int Primary key,
	Specialization nvarchar(100),
	PersonID int Foreign key references Persons(PersonID)
);

Create table Patients(
	PatientID int Primary key,
	PersonID int Foreign key references Persons(PersonID)
);

Create table Prescriptions(
	PrescriptionID int primary key,
	SpecialStructions nvarchar(200),
	MedicationName nvarchar(100),
	Dosage nvarchar(50),
	Frequency nvarchar(50),
	StartDate date,
	EndDate date
);

Create table MedicalRecords(
	MedicalRecordID int Primary key,
	DescreptionOfTheVisit nvarchar(200),
	PrescribedMedicaiton nvarchar(200),
	Diagnosis nvarchar(200),
	AditionalNotes nvarchar(200),
	PrescriptionID int Foreign key references Prescriptions(PrescriptionID)
);

Create table Payments(
	PaymentID int Primary key, 
	PaymentMethod nvarchar(50),
	PaymentDate date,
	AmountPaid decimal,
	AdditionalNotes nvarchar(200)
);

Create table Appointments(
	AppointmentID int Primary key,
	AppointmentStatus tinyint,
	AppointmentDateTime datetime,
	DoctorID int Foreign key references Doctors(DoctorID),
	PatientID int Foreign key references Patients(PatientID),
	MedicalRecordID int Foreign key references MedicalRecords(MedicalRecordID),
	PaymentID int Foreign key references Payments(PaymentID)
);

