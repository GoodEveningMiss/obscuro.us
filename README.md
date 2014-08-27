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
3. Get this repo!
	* Install [git](http://git-scm.com/downloads) if you don't have it.
	* `git clone git@github.com:GoodEveningMiss/ideal.ly.git`
	* `cd ideal.ly`
	* `bundle install` & resolve any errors (see 4. for issues with pg gem)
	* run `rails generate bootstrap:install -f` to use bootstrap-generators
4. Set up database
  * Install Postgres dependencies (Look up your system and pg gem/Postgres)
  * Create app user: `sudo su - postgres -c psql` & `create role ideally with createdb login password 'ideally';`
  * Change Postgres access configuration:
    * `sudo vi /etc/postgresql/9.1/main/pg_hba.conf`
    * Change line ~90ish from `local all all peer` to `local all all md5`
    * Restart Postgres (Look up how to do so for your OS)
	* Create database and tables: `rake db:create` & `rake db:migrate`
	* Run `rake db:seed` to set up intial admin user (to set up more admin users)
5. Run the app!
	* `rails server`
	* go to http://localhost:3000 with your browser
 
## Deploying
1. Download heroku-toolbelt (Optional)
2. Add the heroku repo as a remote for the repo
3. Make sure you have access to the heroku app & an account
4. Add your ssh key to your heroku account
5. Push changes to heroku master
  * Only do this if your sure the changes are stable
  * `git push heroku master`
