/*
create article entry
*/
INSERT INTO dbo.Articles (url_long, upvotes, downvotes, title, wiki)
	VALUES ('##url##', 0, 0, '##title##', '');

/*
create source entry
*/
INSERT INTO WebSources (url_short, upvotes, downvotes)
	VALUES ('##parsed short url##', 0);



/*
check if article exists
*/
SELECT url_long 
FROM Articles as A
WHERE A.url_long = '##url##';

/*
check if user exists
*/
SELECT user_id
FROM UserVotes as U
WHERE U.user_id = '##user_id##';

/*
check if websource exists
*/
SELECT url_short
FROM WebSources as W
WHERE W.url_short = '##parsed short url##';





/*
PRIMARY FUNCTION upvote
*/
UPDATE Articles
SET upvotes = upvotes + 1
WHERE url_long = '##url##';

INSERT INTO UserVotes (user_id, url_long, vote)
	VALUES ('##user_id##', '##url##', 1);

UPDATE WebSources
SET upvotes = upvotes + 1
WHERE url_short = '##parsed short url##';

/*
PRIMARY FUNCTION downvote
*/
UPDATE Articles
SET downvotes = downvotes + 1
WHERE url_long = '##url##';

INSERT INTO UserVotes (user_id, url_long, vote)
	VALUES ('##user_id##', '##url##', -1);

UPDATE WebSources
SET downvotes = downvotes + 1
WHERE url_short = '##parsed short url##';


/*
PRIMARY FUNCTION get article info
*/
SELECT upvotes, downvotes, title, wiki
FROM dbo.Articles as A
WHERE A.url_long = '##url##';

/*
PRIMARY FUNCTION get source votes
*/
SELECT upvotes, downvotes
FROM WebSources as W
WHERE W.url_short = '##parsed short url##';

/*
PRIMARY FUNCTION get most voted
*/
SELECT TOP ##num_articles## *
FROM Articles as A
ORDER BY A.downvotes + A.upvotes desc

/*
PRIMARY FUNCTION get articles by title phrase
*/
SELECT *
FROM Articles as A
WHERE A.title LIKE '%##phrase##%'

/*
PRIMARY FUNCTION update wiki
*/
UPDATE Articles
SET wiki = '##wiki##'
WHERE url_long = '##url##'

/*
PRIMARY FUNCTION check if user has voted on article
*/
SELECT U.vote
FROM UserVotes as U
WHERE U.user_id = '##user##' and U.url_long = '##url##'

