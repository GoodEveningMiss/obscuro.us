# ideal.ly
frictionless idea crowdsourcing and collaborative task management in an drop.io inspired format

## Getting started
1. Install Rbenv, Ruby/Rails
	* [rbenv](https://github.com/sstephenson/rbenv) (use Homebrew on Mac)
	* [ruby-build rbenv plugin](https://github.com/sstephenson/ruby-build)  (use Homebrew on Mac)
	* Install Ruby dependencies: https://github.com/sstephenson/ruby-build/wiki#suggested-build-environment
	* Install Ruby:	`rbenv install 2.1.2`
	* Set 2.1.2 as the default Ruby version: `rbenv global 2.1.2`
	* Install Rails: `gem install rails`
	* Generate rbenv shims for new commands: `rbenv rehash`
2. Get this repo!
	* Install [git](http://git-scm.com/downloads) if you don't have it.
	* `git clone git@github.com:GoodEveningMiss/ideal.ly.git`
	* `cd ideal.ly`
	* `bundle install` & resolve any errors
		* run `rails generate bootstrap:install -f` to use bootstrap-generators
	* Create database and tables: `rake db:create` & `rake db:migrate`
3. Run the app!
    * `rake db:migrate`
	* `rails server`
	* go to http://localhost:3000 with your browser
