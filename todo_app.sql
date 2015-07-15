DROP USER "michael";

CREATE USER micahel WITH ENCRYPTED PASSWORD 'stonebreaker';

DROP database "todo_app";

CREATE database "todo_app";

\c "todo_app";


CREATE TABLE tasks
(
	id serial NOT NULL,
	title varchar(255) NOT NULL,
	description text,
	created_at timestamp without time zone DEFAULT now() NOT NULL,
	updated_at timestamp without time zone,
	completed boolean NOT NULL DEFAULT false,
	UNIQUE(id)
);

CREATE TABLE tasks
(
	id serial NOT NULL,
	title varchar(255) NOT NULL,
	description text,
	created_at timestamp without time zone DEFAULT now() NOT NULL,
	updated_at timestamp without time zone,
	completed boolean NOT NULL DEFAULT false,
	UNIQUE(id),
	PRIMARY KEY(id)
);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at timestamp without time zone NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL();
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks VALUES (DEFAULT,'Study SQL','Complete this excercise',now(),now(),NULL);
INSERT INTO tasks VALUES (DEFAULT,'Study PostgreSQL', 'Read all the documentation');


SELECT * FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at = now() WHERE title = 'Study SQL';^C

SELECT * FROM tasks WHERE completed_at IS NULL;

SELECT title,description FROM tasks WHERE completed_at IS NULL;

SELECT created_at FROM tasks ORDER BY created_at DESC NULLS FIRST;

INSERT INTO tasks VALUES (DEFAULT,'mistake 1','a test entry');
INSERT INTO tasks VALUES (DEFAULT,'mistake 2', 'another test entry');
INSERT INTO tasks VALUES (DEFAULT,'third mistake', 'another test entry');

SELECT * FROM tasks WHERE title LIKE '%mistake%';

DELETE FROM tasks WHERE title LIKE '%mistake 1';

SELECT title,description FROM tasks WHERE title LIKE '%mistake%';
DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks ORDER BY title ASC NULLS FIRST;
