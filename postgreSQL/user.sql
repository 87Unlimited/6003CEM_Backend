CREATE TABLE public.users (
	id serial4 NOT NULL,
	firstname varchar(32) NULL,
	lastname varchar(32) NULL,
	username varchar(16) NOT NULL,
	about text NULL,
	dateregistered timestamp NOT NULL DEFAULT now(),
	"password" varchar(32) NULL,
	passwordsalt varchar(16) NULL,
	email varchar(64) NOT NULL,
	avatarurl varchar(64) NULL,
	CONSTRAINT users_email_key UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (id),
	CONSTRAINT users_username_key UNIQUE (username)
);

INSERT INTO users (username, password, email) VALUES
	('alice', 'password', 'alice@example.com'),
	('bob', 'password', 'bob@example.com'),
	('colin', 'password', 'colin@example.com');
