## What is RequestRefinery?

RequestRefinery quickly implements 3 different systems:

1. [User authentication](#user-authentication)
2. [Access Control](#access-control)
2. [Controller security](#controller-security)

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
Add the following to your routes.rb file:

```ruby
mount RequestRefinery::Engine, at:'/'
```

If you want a basic suite of records to get you started (an admin user, basic controler filters, etc) run the install generator

```console
rails generate request_refinery:install
```

The generator will add the following records to your tables:

Admin User:
* email: admin@admin.fake
* password: password

Permissions:
* view
* edit
* create
* delete
* all

Roles:
* admin

Controller Filters:
* GET    permissions: view
* POST   permissions: create
* PUT    permissions: edit
* PATCH  permissions: edit
* DELETE permissions: delete"

### User Authentication

RequestRefinery comes preinstalled and configured with Devise, so you get user functionality out of the box.  It is configured to require a login to access any resource.

A User has the following attributes that describe the level of access he or she has:
* permissions: returns a comprehensive list of permissions that the user has (taking into account their roles and restrictions)
* roles: returns a list of roles the user has
* restrictions: returns a list of permissions that the user is denied

### Access Control

RequestRefinery does not actually implement any access restrictions on a view or controller level, since that needs to be defined by you, the developer/administrator.  It does however, provide a tool to allow easy definition of what level of access each resource requires.  This tool is the authorized_to? method, which is available to anything that inherits from application controller (controllers and views).  This method will accept one or more of the following: a string specifying the permission name, a symbol specifying the permission name, a permission object.  So an example of using this method would look like

(in a view)
```ruby
<% if authorized_to? [:delete, "view", RequestRefinery::Permission.first] %><td><%= link_to 'Destroy', "/#{model.model_name.route_key}/#{instance.id}", method: :delete, data: { confirm: 'Are you sure?' } %></td><% end %>
```

(in a controller)
```ruby
if authorized_to? :run_method
	self.method
end
```

authorized_to? returns either true or false.  When you pass in more than one permission, it matches with an AND, meaning that if you pass in [:view, :edit] the user must have view permissions AND edit permissions for it to return true.

### Controller Security
By default, RequestRefinery will check every single http request that comes in and reject it if the user does not have permissions matching the rules for that type of request.  These permissions are defined by a controller filter.  A controller filter has 4 attributes:

* http_method: the http method of the request (ie - GET, PUT, POST, etc)
* controller: the name of the controller (ex: PostsController)
* action_name: the name of the requested controller method (ie - 'index' would indicate PostsController.index)
* permissions: what permissions are required of requests that match this filter (an array of RequestRefinery::Permission objects)

These filters can have a broader scope than just a specific controller method.  For instance:

Create a filter that will require all GET requests to have `:view` permissions:
```ruby
RequestRefinery::ControllerFilter.new(http_method:'get',permissions:[RequestRefinery::Permission.where(name:"view").first]).save
```
Create a filter that will require all CustomersController requests to have `:manage_customer` permissions:
```ruby
RequestRefinery::ControllerFilter.new(controller:'CustomersController',permissions:[RequestRefinery::Permission.where(name:"manage_customers").first]).save
```
Create a filter that will require all PUT requests for UsersController to have `:modify_users` permissions:
```ruby
RequestRefinery::ControllerFilter.new(controller:'CustomersController',http_method:"put",permissions:[RequestRefinery::Permission.where(name:"modify_users").first]).save
```

