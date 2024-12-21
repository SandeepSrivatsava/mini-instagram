-- 1--> "Retrieve all photos uploaded by User X."

SELECT * 
FROM Photo
WHERE File_ID IN (
    SELECT File_ID 
    FROM File 
    WHERE User_ID IN ('1', '5', '9')
);



-- 2--> "Display all files in the 'Travel' category."

SELECT * FROM File
WHERE File_ID IN (
    SELECT File_ID FROM Photo WHERE Categories = 'Travel'
    UNION
    SELECT File_ID FROM Video WHERE Categories = 'Travel'
    UNION
    SELECT File_ID FROM Blog WHERE Categories = 'Travel'
);



-- 3--> "Show the latest blog posts by users in School Y."

SELECT * FROM Blog
WHERE File_ID IN (
    SELECT File_ID FROM File WHERE User_ID IN 
        (SELECT User_ID FROM User WHERE School_ID = '1')
);



-- 4--> "Display all comments on Photo Z."

SELECT * FROM Comment WHERE File_ID IN ('10');



-- 5--> "Identify the most liked video."

SELECT *
FROM Video
WHERE File_ID IN (
    SELECT File_ID
    FROM Likes
    WHERE File_ID IN (SELECT File_ID FROM Video)
)
ORDER BY (
    SELECT COUNT(File_ID)
    FROM Likes
    WHERE File_ID = Video.File_ID
) DESC
LIMIT 1;



-- 6--> "Get all files liked by User A."

SELECT * FROM File
WHERE File_ID IN (SELECT File_ID FROM Likes WHERE User_ID = '1');



-- 7--> "Count the total number of likes for File B."

SELECT COUNT(Like_ID) AS TotalLikes
FROM Likes
WHERE File_ID = '5';



-- 8--> "Display all files uploaded in the last 100 days."

SELECT *
FROM File
WHERE Date_Uploaded >= CURRENT_DATE() - INTERVAL 100 DAY
LIMIT 0, 1000;



-- 9 --> "Show all users affiliated with School X."

SELECT * FROM User
WHERE School_ID = '2';



-- 10 --> -- To select Male Users
SELECT *
FROM User
WHERE Gender = 'Male';

-- To select Female users
SELECT *
FROM User
WHERE Gender = 'Female';