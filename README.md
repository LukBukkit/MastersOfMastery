# Masters Of Mastery

This is my application for the Riot API Challange. It pulls data from the featured games and save the masteries of participants
The mastery points will be combined and visualized beautifully.

## Tech stuff

* [Ruby](https://www.ruby-lang.org) version: 2.2

* [Ruby On Rails](http://rubyonrails.org/) version: Rails 5.0.0.beta4

## Installing

* Before you start the application for the first time or if some gems are missing, use `bin/bundle install`.

* To setup the database just run the command `bin/rake db:migrate RAILS_ENV="production"`

* You'll have to pass 2 keys using the environment variables. The first is `SECRET_KEY_BASE` and second is the `RIOT_API_KEY`.
The `SECRET_KEY_BASE` is just a long string for encrypting the the sessions. The `RIOT_API_KEY` is your API-Key.

* The server needs data to display the page. You can fetch the data for the first time with `bin/rake riot_tasks:championpoints_task RAILS_ENV="production"`.
The server will automaticly fetch all 15 minutes. It's important that you set the the variable `RIOT_API_KEY` before!

* When you set the variables and configured the database, you can
start the server with `bin/rails server -p [YOUR PORT] -e production`.

* If you are using a windows system you'll have add `ruby` before the commands above. E.g: `ruby bin/bundle install`