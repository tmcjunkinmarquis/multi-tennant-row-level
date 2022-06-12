# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* based on this tutorial
https://blog.appsignal.com/2020/12/02/building-a-multi-tenant-ruby-on-rails-app-with-subdomains.html

* macOS Monterey
needed some fussing with the install for mysql: https://github.com/brianmario/mysql2/issues/795#issuecomment-1109313029

* Ruby, Rails, MySql versions
ruby '3.1.0'
rails '~> 6.1.5'
mysql '~> 0.5'

* Getting the servers and foundational data established.
Stop other existing postgresql server with `brew services stop postgresql`
Start the mysql server with `brew services start mysql`
Scaffold the first model (per tutorial)
Create the db with `rails db:create`
Run the migration with `rails db:migrate`
Start the rails server locally `rails s`
Check it out: http://localhost:3000/authors
Scaffold the next model (per tutoria)
Run the migration, confirm on http://localhost:3000/articles
Run the tests with `rails test`, probably need to add `gem 'net-smtp'` to the gemfile.
Resolve the errors.
Add authors (the tenants). 
Add articles.

Key info:  "the critical requirement is to add the tenant_id field to every model that is going to be managed by our tenants."

Add tenant_id to Article with `rails g migration AddTenantIdToArticle tenant_id:integer`
Run tests, resolve error (by commenting parallelize statement in test/test_helper.rb) from outstanding issue(https://github.com/rails/rails/issues/41176)


* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
