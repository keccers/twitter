Preferred Sinatra framework
=================

This is the source code for the my preferred Sinatra-template.

I use it to start most sinatra projects.

What's inside?
--------------

* Active Record as ORM
* bCrypt for User authentication
* Postgres for database
* Rakefile, Gemfile, .gitignore
* Sass, [Bourbon](http://bourbon.io), [Neat](http://neat.bourbon.io)

Folders Structure
------------------

    app/
      controllers/
        index.rb     # Specific controller

      helpers/         

      models/          
      
      views/
        layout.erb   # Common layout
        index.erb    # Specific view

    config/
      database.rb    #
      environment.rb # Envirnment 

    db/
      migrate/       
      seeds.rb       # Seed data for development

    spec/         
      spec_helper.rb # Test helper

    public/
      js/
      stylesheets/


Setup
-----

    git clone https://github.com/mbacksmeier/sinatra-template.git
    cd sinatra-template

Install bundler

    gem install bundler

Install the gems

    bundle install --without production staging

View all available rake commands

    rake -T
    rake console             # Start IRB with application environment loaded
    rake db:build            # Drop, create, migrate, and database
    rake db:create           # Create the database at sinatra_framework_development
    rake db:drop             # Drop the database at sinatra_framework_development
    rake db:migrate          # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
    rake db:rebuild          # Drop, create, migrate, and seed database
    rake db:seed             # Populate the database with dummy data by running db/seeds.rb
    rake db:version          # Returns the current schema version number
    rake generate:migration  # Create an empty migration in db/migrate
    rake generate:model      # Create an empty model in app/models, e.g., rake generate:model NAME=User
    rake generate:spec       # Create an empty model spec in spec, e.g., rake generate:spec NAME=user
    rake spec                # Run the specs

Run the server

    shotgun config.ru

Go to [http://127.0.0.1:9393](http://127.0.0.1:9393)

Legal
-----

MIT License

The MIT License (MIT)

Copyright (c) 2013

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE. 
