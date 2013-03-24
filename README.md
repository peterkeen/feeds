# Feeds
## A simple RSS to email feed reader

Feeds consumes some RSS feeds and squirts each post out to
an email address of your choice. It's a Rails app because 
it actually requires all of the bits that Rails provides,
not just because it was the handiest hammer in the toolbox.

## Installation on Heroku

    $ git clone https://github.com/peterkeen/feeds.git
    $ cd feeds
    $ heroku create
    $ heroku addons:add sendgrid
    $ git push heroku master
    $ heroku run rake db:migrate
    $ heroku config:add USERNAME=username PASSWORD=password FROM_EMAIL=feeds@example.comm TO_EMAIL=you@example.com FETCH_IN_PROCESS=true FETCH_INTERVAL=600

Navigate to http://your-app.herokuapp.com, login with your username and password,
and add a feed or two. Within 10 minutes
