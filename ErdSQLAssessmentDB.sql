CREATE DATABASE Erdsqlassessment;
GO
USE Erdsqlassessment;

CREATE TABLE [User] (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100)
);

CREATE TABLE ToDo (
    ToDoID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Description TEXT,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    Content TEXT,
    ToDoID INT,
    UserID INT,
    FOREIGN KEY (ToDoID) REFERENCES ToDo(ToDoID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

INSERT INTO [User] VALUES (1, 'Alice', 'alice@example.com');
INSERT INTO ToDo VALUES (1, 'Finish Assignment', 'Complete ERD task', 1);
INSERT INTO Comment VALUES (1, 'Started working', 1, 1);


SELECT * FROM [User];
SELECT * FROM ToDo;
SELECT * FROM Comment;

-- Join example
SELECT u.UserName, t.Title, c.Content
FROM [User] u
JOIN ToDo t ON u.UserID = t.UserID
JOIN Comment c ON t.ToDoID = c.ToDoID;


UPDATE ToDo
SET Title = 'Finish ERD Assignment'
WHERE ToDoID = 1;


DELETE FROM Comment WHERE CommentID = 1;

