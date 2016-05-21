# Streams

A minimalist aggregator of things with a rating.  It was developed solely to power my [personal website](http://streams.defrang.com) and there are currently no plans to grow the scope beyond that.

## Requirements

* Ruby 2.1
* Rails 4.1
* SQLite (development)
* PostgreSQL (heroku)

## Development

Create a `.env` file with the variables used in `config/secrets.yml`

## Deployment on Heroku

After the app has been created, the following additional steps are required:

### Set the environment variables

Look up in `config/secrets.yml` for an exhaustive list of the required variables.

    heroku config:set SECRET_KEY_BASE=...
    heroku config:set PASSWORD_PEPPER=...
    ...
    heroku config:set TWITTER_ACCESS_TOKEN_SECRET=...

### Activate environment variables at compile-time

    heroku labs:enable user-env-compile -a <application-name>

## License

Released under [The MIT License](http://opensource.org/licenses/MIT)

Copyright © 2013-16 Xavier Defrang
