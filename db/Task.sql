CREATE TABLE `tasks` (
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `title` varchar(255) NOT NULL,
    `description` varchar(255) DEFAULT NULL,
    done boolean DEFAULT FALSE, 
    date datetime NOT NULL
  );

insert into tasks (title, description, done, date) values("Take a walk", "around the park", false, DATETIME('now'));
insert into tasks (title, description, done, date) values("Run Enery Plus", "Finish tweaking model for RTF or something like that", false, DATETIME('now'));
insert into tasks (title, description, done, date) values("Run Enery Plus Again", "Finish tweaking model for TRC?", false, DATETIME('now'));