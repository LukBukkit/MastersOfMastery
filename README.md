# Masters Of Mastery

This is my application for the Riot API Challange. It pulls data from the featured games and save the masteries of participants
The mastery points will be combined and visualized beautifully.

## Tech stuff

* Ruby version: 2.2

* To setup the database and so on, just start the application with `bin/rails server -p [YOUR PORT] -e production`.

* You'll have to pass 2 keys using the environment variables. The first is `SECRET_KEY_BASE` and second is the `RIOT_API_KEY`.
The `SECRET_KEY_BASE` is just a long string for encrypting the the sessions. The `RIOT_API_KEY` is your API-Key.

* Before you start the application for the first time or if some gems are missing, use `bin/bundle install`.

* If you are using a windows system you'll have add `ruby` before the commands above. E.g: `ruby bin/bundle install`