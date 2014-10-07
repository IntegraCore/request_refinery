## Getting started

RequestRefinery 0.0.2 works with Rails 4.0 onwards. You can add it to your Gemfile with:

```ruby
gem 'request_refinery'
```

Run the bundle command to install it.

```console
bundle install
```
Run the migrations to initialize RequestRefinery tables

```console
rake db:migrate
```

If you want a basic suite of records to get you started (an admin user, basic controler filters, etc) run the install generator

```console
rails generate request_refinery:install
```

The generator will add the following records to your tables:

Admin User:
	email: admin@admin.fake
	password: password

Permissions:
	view
	edit
	create
	delete
	all

Roles:
	admin

Controller Filters:
	GET    permissions: view
	POST   permissions: create
	PUT    permissions: edit
	PATCH  permissions: edit
	DELETE permissions: delete"

