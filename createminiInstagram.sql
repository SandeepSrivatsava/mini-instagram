-- Create a table to store schools with unique identifiers and names
CREATE TABLE School (
    School_ID INT PRIMARY KEY,
    School_Name VARCHAR(255)
);


-- Create a table to store user information, including username, gender, and date joined
-- Also, includes a foreign key linking to the School table
CREATE TABLE User (
    User_ID INT PRIMARY KEY,
    Username VARCHAR(255),
    Gender VARCHAR(10),
    Date_Joined DATE,
    School_ID INT,
    FOREIGN KEY (School_ID) REFERENCES School(School_ID)
);


-- Create a table to store uploaded files with details such as title, date, and content
-- Includes a foreign key linking to the User table
CREATE TABLE File (
    File_ID INT PRIMARY KEY,
    User_ID INT,
    Title VARCHAR(255),
    Date_Uploaded DATE,
    Content TEXT,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);


-- Create tables for specific types of content (photo, video, blog) extending the File table
-- Each includes additional category information
CREATE TABLE Photo (
    Photo_ID INT PRIMARY KEY,
    File_ID INT,
    Categories VARCHAR(255),
    FOREIGN KEY (File_ID) REFERENCES File(File_ID)
);

CREATE TABLE Video (
    Video_ID INT PRIMARY KEY,
    File_ID INT,
    Categories VARCHAR(255),
    FOREIGN KEY (File_ID) REFERENCES File(File_ID)
);

CREATE TABLE Blog (
    Blog_ID INT PRIMARY KEY,
    File_ID INT,
    Categories VARCHAR(255),
    FOREIGN KEY (File_ID) REFERENCES File(File_ID)
);


-- Create a table for user-created groups, with an owner identified by Owner_ID
-- Owner_ID is a foreign key linking to the User table
CREATE TABLE `Group` (
    Group_ID INT PRIMARY KEY,
    Owner_ID INT,
    Group_Name VARCHAR(255),
    FOREIGN KEY (Owner_ID) REFERENCES User(User_ID)
);


-- Create a table to store user comments on files, including content and date posted
-- Foreign keys link to both the User and File tables
CREATE TABLE Comment (
    Comment_ID INT PRIMARY KEY,
    User_ID INT,
    File_ID INT,
    Content TEXT,
    Date_Posted DATE,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (File_ID) REFERENCES File(File_ID)
);


-- Create a table to record instances of users liking files, with information on the date of the like
-- Foreign keys link to both the User and File tables
CREATE TABLE Likes (
    Like_ID INT PRIMARY KEY,
    User_ID INT,
    File_ID INT,
    Date_Liked DATE,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    FOREIGN KEY (File_ID) REFERENCES File(File_ID)
);


-- Insert sample data into the School table
INSERT INTO School (School_ID, School_Name) VALUES
(1, 'UNIVERSITY OF DAYTON'),
(2, 'DAYTON UNIVERSITY');


-- Insert sample data into the User table
INSERT INTO User (User_ID, Username, Gender, Date_Joined, School_ID)
VALUES 
    (01, 'SAN', 'Male', '2023-01-01', 1),
    (02, 'TAN', 'Female', '2023-02-02', 2),
    (03, 'NAN', 'Female', '2023-03-03', 1),
    (04, 'HAN', 'Male', '2023-04-04', 1),
    (05, 'DAN', 'Female', '2023-05-05', 2),
    (06, 'PAN', 'Male', '2023-06-06', 2),
    (07, 'RAN', 'Male', '2023-07-07', 1),
    (08, 'YAN', 'Female', '2023-08-08', 2),
    (09, 'WAN', 'Male', '2023-09-09', 1),
    (10, 'VAN', 'Female', '2023-10-10', 2);


-- Insert sample data into the File table
INSERT INTO File (File_ID, User_ID, Title, Date_Uploaded, Content)
VALUES 
    (1, 1, 'Photo1', '2023-01-01', 'Photo content 1'),
    (2, 1, 'Video1', '2023-02-01', 'Video content 1'),
    (3, 2, 'Photo1', '2023-02-02', 'Photo content 1'),
    (4, 2, 'Video1', '2023-02-03', 'Video content 1'),
    (5, 3, 'Photo1', '2023-03-03', 'Photo content 1'),
    (6, 3, 'Video1', '2023-03-04', 'Video content 1'),
    (7, 4, 'Photo1', '2023-04-04', 'Photo content 1'),
    (8, 4, 'Video1', '2023-04-05', 'Video content 1'),
    (9, 5, 'Photo1', '2023-05-05', 'Photo content 1'),
    (10, 5, 'Video1', '2023-05-06', 'Video content 1'),
    (11, 6, 'Photo1', '2023-06-06', 'Photo content 1'),
    (12, 6, 'Video1', '2023-06-07', 'Video content 1'),
    (13, 7, 'Photo1', '2023-07-07', 'Photo content 1'),
    (14, 7, 'Video1', '2023-07-08', 'Video content 1'),
    (15, 8, 'Photo1', '2023-08-08', 'Photo content 1'),
    (16, 8, 'Video1', '2023-08-09', 'Video content 1'),
    (17, 9, 'Photo1', '2023-09-09', 'Photo content 1'),
    (18, 9, 'Video1', '2023-09-10', 'Video content 1'),
    (19, 10, 'Photo1', '2023-10-10', 'Photo content 1'),
    (20, 10, 'Video1', '2023-10-11', 'Video content 1');
    

-- Insert sample data into the Photo table    
INSERT INTO Photo (Photo_ID, File_ID, Categories)
VALUES 
    (1, 1, 'Nature'),
    (2, 3, 'Travel'),
    (3, 5, 'Cityscape'),
    (4, 7, 'Architecture'),
    (5, 9, 'Wildlife'),
    (6, 11, 'Adventure'),
    (7, 13, 'Beach'),
    (8, 15, 'Sunset'),
    (9, 17, 'Portrait'),
    (10, 19, 'Fashion');
    
    

-- Insert sample data into the Video table    
INSERT INTO Video (Video_ID, File_ID, Categories)
VALUES 
    (1, 2, 'Travel'),
    (2, 4, 'Nature'),
    (3, 6, 'Science'),
    (4, 8, 'Documentary'),
    (5, 10, 'Music'),
    (6, 12, 'Technology'),
    (7, 14, 'Education'),
    (8, 16, 'Entertainment'),
    (9, 18, 'Sports'),
    (10, 20, 'Cooking');


-- Insert sample data into the Blog table   
INSERT INTO Blog (Blog_ID, File_ID, Categories)
VALUES 
    (1, 2, 'Technology'),
    (2, 4, 'Travel'),
    (3, 6, 'Food'),
    (4, 8, 'Fashion'),
    (5, 10, 'Health'),
    (6, 12, 'Science'),
    (7, 14, 'Business'),
    (8, 16, 'Art'),
    (9, 18, 'Music'),
    (10, 20, 'Education');
    

-- Insert sample data into the Group table
INSERT INTO `Group` (Group_ID, Owner_ID, Group_Name)
VALUES 
    (1, 1, 'Book Club'),
    (2, 2, 'Fitness Enthusiasts'),
    (3, 3, 'Techies'),
    (4, 4, 'Adventure Seekers'),
    (5, 5, 'Foodies'),
    (6, 6, 'Art Lovers'),
    (7, 7, 'Music Enthusiasts'),
    (8, 8, 'Photography Club'),
    (9, 9, 'Business Network'),
    (10, 10, 'Fashionistas');


-- Insert sample data into the Comment table
INSERT INTO Comment (Comment_ID, User_ID, File_ID, Content, Date_Posted)
VALUES 
    (1, 1, 4, 'Great video!', '2023-03-05'),
    (2, 2, 2, 'Interesting blog!', '2023-03-06'),
    (3, 3, 3, 'Love the photo!', '2023-03-07'),
    (4, 4, 4, 'Awesome content!', '2023-03-08'),
    (5, 5, 6, 'Impressive video!', '2023-03-09'),
    (6, 6, 8, 'Well-written blog!', '2023-03-10'),
    (7, 7, 7, 'Beautiful photo!', '2023-03-11'),
    (8, 8, 8, 'Great work!', '2023-03-12'),
    (9, 9, 10, 'Amazing video!', '2023-03-13'),
    (10, 10, 12, 'Fantastic blog!', '2023-03-14'),
    (11, 1, 11, 'Love the content!', '2023-03-15'),
    (12, 2, 14, 'Inspirational blog!', '2023-03-16'),
    (13, 3, 13, 'Well-captured photo!', '2023-03-17'),
    (14, 4, 16, 'Enjoyed the video!', '2023-03-18'),
    (15, 5, 18, 'Insightful blog!', '2023-03-19'),
    (16, 6, 16, 'Unique photo!', '2023-03-20'),
    (17, 7, 17, 'Great storytelling!', '2023-03-21'),
    (18, 8, 20, 'Impressive video!', '2023-03-22'),
    (19, 9, 19, 'Engaging!', '2023-03-23'),
    (20, 10, 20, 'Fantastic content!', '2023-03-24');


-- Insert sample data into the Likes table
INSERT INTO Likes (Like_ID, User_ID, File_ID, Date_Liked)
VALUES 
    (1, 1, 1, '2023-03-25'),
    (2, 2, 3, '2023-03-26'),
    (3, 3, 5, '2023-03-27'),
    (4, 4, 7, '2023-03-28'),
    (5, 5, 9, '2023-03-29'),
    (6, 6, 11, '2023-03-30'),
    (7, 7, 13, '2023-03-31'),
    (8, 8, 15, '2023-04-01'),
    (9, 9, 17, '2023-04-02'),
    (10, 10, 19, '2023-04-03'),
    (11, 1, 2, '2023-04-04'),
    (12, 2, 4, '2023-04-05'),
    (13, 3, 6, '2023-04-06'),
    (14, 4, 8, '2023-04-07'),
    (15, 5, 10, '2023-04-08'),
    (16, 6, 12, '2023-04-09'),
    (17, 7, 14, '2023-04-10'),
    (18, 8, 16, '2023-04-11'),
    (19, 9, 18, '2023-04-12'),
    (20, 10, 20, '2023-04-13');
    

-- Disable safe updates to allow deleting all records from Photo table
SET SQL_SAFE_UPDATES = 0;


-- Select all rows from each table for verification
SELECT * FROM School;
SELECT * FROM User;
SELECT * FROM File;
SELECT * FROM Photo;
SELECT * FROM Video;
SELECT * FROM Blog;
SELECT * FROM `Group`;
SELECT * FROM Comment;
SELECT * FROM Likes;