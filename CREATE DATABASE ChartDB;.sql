CREATE DATABASE ChartDB;
GO
USE ChartDB;
GO

CREATE TABLE Users (
  user_id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

CREATE TABLE ToDo (
  todo_id INT IDENTITY(1,1) PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(255),
  user_id INT NOT NULL,
  CONSTRAINT FK_ToDo_Users FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
);

CREATE TABLE Comment (
  comment_id INT IDENTITY(1,1) PRIMARY KEY,
  content VARCHAR(255) NOT NULL,
  todo_id INT NOT NULL,
  user_id INT NOT NULL,
  CONSTRAINT FK_Comment_ToDo FOREIGN KEY (todo_id)
    REFERENCES ToDo(todo_id),
  CONSTRAINT FK_Comment_Users FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
);

INSERT INTO Users (name, email) VALUES
('Alice', 'alice@mail.com'),
('Brian', 'brian@mail.com'),
('Cynthia', 'cynthia@mail.com'),
('David', 'david@mail.com'),
('Emily', 'emily@mail.com');

INSERT INTO ToDo (title, description, user_id) VALUES
('Buy groceries', 'Get milk, eggs, bread', 1),
('Finish assignment', 'ERD and SQL project', 2),
('Clean the house', 'Sweep, mop, dust', 3),
('Pay bills', 'Electricity and water', 1),
('Plan trip', 'Book hotel and transport', 4);

INSERT INTO Comment (content, todo_id, user_id) VALUES
('Remember to buy fruits too', 1, 2),
('Submit before midnight', 2, 3),
('Don’t forget the living room', 3, 4),
('Set reminders for next month', 4, 1),
('Invite friends to join', 5, 5);
