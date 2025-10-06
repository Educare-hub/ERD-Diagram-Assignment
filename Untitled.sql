CREATE TABLE `Users` (
  `user_id` int PRIMARY KEY,
  `name` varchar(255),
  `email` varchar(255)
);

CREATE TABLE `ToDo` (
  `todo_id` int PRIMARY KEY,
  `title` varchar(255),
  `description` varchar(255),
  `user_id` int
);

CREATE TABLE `Comment` (
  `comment_id` int PRIMARY KEY,
  `content` varchar(255),
  `todo_id` int,
  `user_id` int
);

ALTER TABLE `ToDo` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`todo_id`) REFERENCES `ToDo` (`todo_id`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);
