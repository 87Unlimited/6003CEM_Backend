CREATE TABLE public.articles (
	id serial4 NOT NULL,
	title varchar(32) NOT NULL,
	alltext text NOT NULL,
	summary text NULL,
	datecreated timestamp NOT NULL DEFAULT now(),
	datemodified timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	imageurl varchar(2048) NULL,
	published bool NULL,
	authorid int4 NULL,
	CONSTRAINT articles_pkey PRIMARY KEY (id)
);


INSERT INTO articles (title, allText, authorID) VALUES
	('title 1', 'some stuff', 1),
	('another title', 'interesting', 1),
	('last one', 'ok', 1),
	('this title is good', 'some text', 3);

INSERT INTO articles (title, allText, summary, datecreated, datemodified, imageurl, published, authorid) VALUES
('Golden Retriever', 'The Golden Retriever is a large-sized breed of dog known for its friendly and tolerant attitude. They are intelligent, obedient, and eager to please. Golden Retrievers are often used as guide dogs, search and rescue dogs, and therapy dogs.', 'The Golden Retriever is a friendly and intelligent breed.', NOW(), NOW(), 'https://example.com/golden_retriever.jpg', true, 1),
('Labrador Retriever', 'The Labrador Retriever is a medium-to-large-sized breed of dog known for its friendly and outgoing nature. They are highly versatile and excel in various roles such as assistance dogs, hunting companions, and therapy dogs.', 'The Labrador Retriever is a versatile and friendly breed.', NOW(), NOW(), 'https://example.com/labrador_retriever.jpg', true, 2),
('German Shepherd', 'The German Shepherd is a breed of working dog known for its intelligence and versatility. They are often used in police and military roles, as well as in search and rescue operations. German Shepherds are loyal, courageous, and highly trainable.', 'The German Shepherd is an intelligent and loyal breed.', NOW(), NOW(), 'https://example.com/german_shepherd.jpg', true, 3),
('Poodle', 'The Poodle is a highly intelligent and elegant breed of dog. They come in three different sizes: standard, miniature, and toy. Poodles are known for their curly, hypoallergenic coat and their playful and friendly nature.', 'Poodles are intelligent and elegant dogs with a curly coat.', NOW(), NOW(), 'https://example.com/poodle.jpg', true, 2),
('Bulldog', 'The Bulldog, also known as the English Bulldog, is a medium-sized breed with a distinctive wrinkled face and a sturdy build. Despite their tough appearance, Bulldogs are gentle, affectionate, and great with children. They make excellent family pets.', 'Bulldogs are gentle and affectionate dogs with a distinctive appearance.', NOW(), NOW(), 'https://example.com/bulldog.jpg', true, 3),
('Siberian Husky', 'The Siberian Husky is a medium-sized working dog known for its striking blue or multi-colored eyes and thick coat. They are energetic, friendly, and love to be part of an active family. Huskies are often used as sled dogs and excel in cold climates.', 'Siberian Huskies are energetic and friendly dogs with a striking appearance.', NOW(), NOW(), 'https://example.com/siberian_husky.jpg', true, 1);
