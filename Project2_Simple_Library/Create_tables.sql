Create database Simple_Library;


USe Simple_Library;

Create table Books(
	BookID int Primary key,
	Title nvarchar(255),
	ISBN nvarchar(50),
	publicationDate date,
	Genre nvarchar(50),
	AdditionalDetails nvarchar(max)
);

Create table Authors(
	AuthorID int Primary key,
	AuthorName nvarchar(50),
	BookID int Foreign key references Books(BookID)
);

Create table BookCopies(
	BookCopyID int Primary key,
	AvailabilityStatus bit,
	BookID int Foreign key References Books(BookID)
);

Create table Users(
	UserID int Primary key,
	Name nvarchar(100),
	ContactInformation nvarchar(255),
	LibraryCardNumber nvarchar(50)
);

Create table BorrowingRecords(
	BorrowingID int Primary key,
	BorrowingDate date,
	DueDate date,
	ActualReturnDate date,
	BookCopyID int foreign key references BookCopies(BookCopyID),
	UserID int foreign key references Users(UserID)
);

Create Table Reservations(
	ReservationID int Primary key,
	ReservationDate date,
	BookCopyID int foreign key references BookCopies(BookCopyID),
	UserID int foreign key references Users(UserID)
);

Create table fines(
	FineID int Primary key, 
	NumberOfLateDays smallint,
	FineAmount decimal,
	PaymentStatus bit,
	BorrowingID int Foreign key references BorrowingRecords(BorrowingID),
	UserID int foreign key references Users(UserID)
);

Create table Settings(
	DefaultBorrowDays tinyint,
	DefaultFinePerDay tinyint
);