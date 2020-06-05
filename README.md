# Friendface

## Project Description

Implement a JSON REST-style API that analyzes data from Friendface, a totally
legit social media platform.

## Instructions

* Fulfill the requirements below. When done please send us a zip of the git repo

## Requirements

* Tools are up to you. Add whatever gems you find useful.

* Friendface is a little behind the times so its API serves data in CSV instead
  of JSON. The accompanying [friendface.csv](https://gist.github.com/dabobert/4a31d09d20988ef0f128a6be57fa60d0) (located in the root of the app) file contains data
  about the "likes" that your posts have received.

* Ingest the CSV and expose four REST-style `GET` routes that return the following data:

    * Your most popular post(s)

    * Your biggest fan(s) (the person who has "liked" your posts the most times)

    * The day(s) of the week when you got the most "likes"


* The actual schema of the returned JSON doesn’t really matter as long
  as it represents the data in a clear manner to any client that might consume
  your API.

* There are no requirements around data persistence. Whether you use a real
  database, an in-memory database, an in-memory data structure, or have no
  persistence at all is up to you.  But if you use a database please use SQLite

* Please leave comments in places where you weren’t quite sure if you
  were solving the problem correctly to let us know that you've thought about it
  and made a conscious decision.

* Down below please provide working instructions for how to run your application and
  make sure that the application will actually run on someone else’s machine.

## Extra Credit 
* Write some tests for your logic. Don’t bother with integration tests
  unless you really feel like it.

## Write Instructions Below:
These should be enough to get the project working:
```
docker-compose build
docker-compose up
docker-compose exec web rake db:migrate
docker-compose exec web rake data:ingest
```
then you should be able to hit localhost:3000
http://localhost:3000/api/1/likes/popular_posts  
http://localhost:3000/api/1/likes/biggest_fans 

Thoughts: 
- I burnt through too much time on getting rails up and running on an old windows laptop (after 7 years on a mac ), so towards the end, I was definitely rushing, and didn't get to finish the final route.
- I went down the sqlite route since it was already set up.  I wrote a migration to add a simple schema to the db and built an idempotent rake task to ingest the CSV file into it.
- To have something to show in time, I wrote some raw SQL to do the queries, but normally, I would have used ActiveRecord, or Arel if necessary.
- Additionally, I would have moved those queries to a model file, leaving my controllers as thin as possible.
- When planning the API schema, I allowed for a user_id parameter, in case we'd allow for peeking on other people's stats. If not, the user_id would be automatically read from an authentication session variable.
