/*
create article entry
*/
INSERT INTO Articles (url_long, votes, title, wiki)
	VALUES ('##url##', 0, '##title##', '');

/*
create source entry
*/
INSERT INTO WebSources (url_short, votes)
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
PRIMARY FUNCTION send a vote
*/
UPDATE Articles
SET votes = votes ##+/-1##
WHERE url_long = '##url##';

INSERT INTO UserVotes (user_id, url_long, vote)
	VALUES ('##user_id##', '##url##', ##+/-1##);

UPDATE WebSources
SET votes = votes ##+/-1##
WHERE url_short = '##parsed short url##';


/*
PRIMARY FUNCTION get article votes
*/
SELECT votes
FROM Articles as A
WHERE a.url_long = '##url##';

/*
PRIMARY FUNCTION get source votes
*/
SELECT votes
FROM WebSources as W
WHERE W.url_short = '##parsed short url##';