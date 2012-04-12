![Hazel](http://c7.github.com/hazel/images/hazel_small.png)

A simple Sinatra app generator, heavily based on [snfn](https://github.com/zachpendleton/snfn).

![Using Hazel](http://c7.github.com/hazel/images/using_hazel.gif)

## Installation

    gem install hazel

## Configuration

*  `-d` Database. Options are "postgres," "mysql," "sqlite", and "mongo."
   Default is "sqlite."
*  `--redis` Include Redis configuration options.
* `--rvm-gemset` Create a new RVM Gemset under the current Ruby
* `--no-database` Don't include any database config options.
* `--no-bundle-install` Don’t run bundle install after generating the app
* `--no-git-repo` Don’t initialize a Git repository

## Example

Standard app, using sqlite.

    hazel my_app

App using MySQL and Redis.

    hazel my_app -d mysql --redis

App using MongoDB and Redis, but don’t run bundle install.

    hazel my_app -d mongo --redis --no-bundle-install

## Architecture

The template autoloads files in config/initializers and
/lib. Database configuration options are stored in `config/db.yml`
and are loaded via `config/initializers/database.rb`.

## DB Setup

[Sequel](http://sequel.rubyforge.org) is used as an ORM for
relational databases, and migrations are stored in db/migrate.
Migrations can be run using the rake command `rake rb:migrate`.

[mongodb_model](https://github.com/alexeypetrushin/mongodb_model)
is used for Mongo apps, with the config options
stored in the same files as relational databases (`config/db.yml`
and `config/initializers/database.rb`).

### More information

*  [Sequel Migrations](http://sequel.rubyforge.org/rdoc/files/doc/migration_rdoc.html)
*  [Sequel Models](http://sequel.rubyforge.org/rdoc/classes/Sequel/Model.html)

## License

    Copyright (c) 2012 Peter Hellberg
    
    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:
    
    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
    LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
    OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
    WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
