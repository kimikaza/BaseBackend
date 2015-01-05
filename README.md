BaseBackend
===========

goal for this project is to provide a RoR app template which contains:

- Authentication/Authorisation, through mobile or web, or through oauth providers such as Facebook, Twitter, Google+ (done, oauth FB demo provided)

- App should be made in such a fashion it can be packed as some kind of distributed system in Docker or similar so we can deploy it to AWS, Digital Ocean or anywhere else, and also, to Heroku if needed - (TBD)

- push notifications should be possible for mobile apps, push should be done through houston/any gem for android, with separation of concerns executed in such a way that we can realtively easily switch to commercial push provider, such as urban airship - (OUT OF SCOPE)

- let's try to do authentication with warden (done)

- let's have a same model for a different role (possibly different user interface for log in etc...) (done)

- let's have authorization with pundit gem (done)

- every user could have one or more roles (done)

- nevertheless, crete a role table with a list of possible roles...(done, indirectly with royce)

- how to fit active admin here? (we'll try in the end, if it doesn't work, roll our own admin)

- let's try to write this in a test driven fashion (TBD)

- User and similar models should keep their basic authentication data to themselves, additional 1 to 1 data should be kept outside, maybe even through inherited tables? - (decided to leave this out of scope of this project for now)



