======

#Sufi

The worlds best internal coffee system to resolve conflicting issue of ordering coffee. Built using Angular JS and Rails as a backend.

##Project structure

The project has been structured in such a way that the angular code sits in the ngapp folder leaving rails as a completely isolated backend.

Its important to stress the benefit of this structure as it keeps the frontend and backend separate making, which effectively increases development
and draws a clear distinction between the two technologies used.

###Yeoman, Grunt, Bower and Karma JS Runner

Sufi has a Angular front-end that has been constructed using Yeoman. A subset of tools to make web development fun and exciting. Yeoman consist of three
following tools:

* [Yo](https://github.com/yeoman/yo)- Scaffolds out a new application whilst writing to the Gruntfile.
* [Grunt](http://gruntjs.com) - Javascript task runner that manipulates web apps.
* [Bower](http://bower.io) - Package manager for the web that allows you to add additional functionality.
* [Rails](http://rubyonrails.org) - Ruby on Rails open source web framework to bring happiness.

##Getting Started

###Setting up environment

* Ruby version 2.0.0
* Rails version 4.0.0

Visit: http://railsinstaller.org/en to install latest version

* Nodejs
* Node Package Manager (npm)

Visit: http://nodejs.org/ to install

###Running rails backend

```
rvm use 2.0.0
git clone https://github.com/aaronmason/sufi
cd sufi

Set up `database.yml` which should be located in app/config/ example below

development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: sqlite3
  database: db/production.sqlite3
  pool: 5
  timeout: 5000


bundle exec rake db:migrate
gem install compass
bundle install
bundle exec rails s
```

###Setting up Grunt server

```
nvm use 0.10.13 (should be the latest)
cd sufi/ngapp
sudo npm install -g yo grunt-cli bower karma 
npm install 
bower install 
grunt server (Will run on port 3000)
grunt (Prepare app for deployment)
```

###Angular + Rails diagram

![Application Layout](http://i.imgur.com/NbY4ELb.jpg "Application Layout")

The purpose of this setup is to simulate the whole environment in a single web application. Before pushing to production
the whole angular will sit inside rails' app/public

The grunt server should be bale to proxy any url with the path to the rails backend on localhost:3000 by doing [Gist](https://gist.github.com/anonymous/6462007)
the above snippet will sit inside the Gruntfile.js so that when the grunt server is run any reference to the api will look up localhost:3000


##Testing

To run the tests for the front-end for angular do the following:

```
cd ngapp
node scripts/web-server.js (Starts webserver)
Open browser and redirect to http://localhost:8000/test/e2e/runner.html
```

##Documentation and Support

Support for this project can be found at the following:

* [AngularJS](http://angularjs.org/)
* [Yeoman](http://yeoman.io)
* [NodeJS](http://nodejs.org)
* [npm](https://npmjs.org)

####Issues

errors: Puma 2.5.1 will not work on windows please remove this

##Similar Projects

In progress

##Contributing

If you make improvements to this application, please share with others.

* Fork the project on GitHub.
* Make your feature addition or bug fix.
* Commit with Git.
* Send the author a pull request.

If you add functionality to this application, create an alternative implementation, or build an application that is similar, please contact me and I'll add a note to the README so that others can find your work.