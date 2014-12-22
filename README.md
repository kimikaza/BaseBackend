BaseBackend
===========

goal for this project is to provide a RoR app template which contains:

- Authentication/Authorisation, through mobile or web, or through oauth providers such as Facebook, Twitter, Google+

- API points for most actions, so we can access with a pure JSON to make it possible for iOS, Android, or any other client frontend to feel welcome as being the frontend for this app

- App should be made in such a fashion it can be pacekd as some kind of distributed system in Docker or similar so we can deploy it to AWS, Digital Ocean or anywhere else, and also, to Heroku (in its purest form) if needed

- push notifications should be possible for mobile apps, push should be done through houston/any gem for android, with separation of concerns executed in such a way that we can realtively easily switch to commercial push provider, such as urban airship

- let's try to do authentication with authlogic

- let's have a different model for a different role (possibly different user interface fro log in etc...)

- let's have authorization with pundit gem

- every user could have only one role...

- nevertheless, crete a role table with a list of possible roles...

- how to fit active admin here? (we'll try in the end, if it doesn't work, roll our own admin)

- let's try to write this in a test driven fashion

- User and similar models should keep their basic authentication data to themselves, additional 1 to 1 data should be kept outside, maybe even through inherited tables?



