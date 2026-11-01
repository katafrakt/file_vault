CREATE TABLE `schema_migrations`(
  `filename` varchar(255) NOT NULL PRIMARY KEY
);
CREATE TABLE `files`(
  `id` integer NOT NULL PRIMARY KEY AUTOINCREMENT,
  `filename` text NOT NULL,
  `internal_filename` string NOT NULL,
  `size` integer NOT NULL,
  `title` text NULL,
  `author` text NULL,
  `description` text NULL,
  `pages` integer NULL,
  `image_width` integer NULL,
  `image_height` integer NULL
);
INSERT INTO schema_migrations (filename) VALUES
('20261031132409_add_files.rb'),
('20261101090833_add_metadata_to_files.rb');
