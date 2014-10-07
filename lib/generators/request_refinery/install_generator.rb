require 'rails/generators/base'

module RequestRefinery
	module Generators
		class InstallGenerator < Rails::Generators::Base

			############################################################
			# Seed data ################################################
			############################################################

			# Create an initial set of Permissions
			puts "Creating default permission set\n\tview\n\tedit\n\tcreate\n\tdelete\n\tall"
			perms = []
			perms << view = Permission.new(name:"view")
			perms << edit = Permission.new(name:"edit")
			perms << create = Permission.new(name:"create")
			perms << delete = Permission.new(name:"delete")
			perms << all = Permission.new(name:"all")
			perms.each{|x| x.save}

			# Create an initial admin role
			puts "Creating admin role with permission 'all'"
			admin = Role.new(group: "admin")
			admin.permissions = [all]
			admin.save

			# Create an initial admin user
			puts "Creating user 'temporary admin' with 'admin' role"
			email = "admin@admin.fake"
			password = "password"
			puts "\tUsername: #{email}\n\tPassword: #{password}"
			admin_user = User.new(email:email,password:password,first_name:"temporary",last_name:"admin")
			admin_user.roles << admin
			admin_user.save

			# Create default set of controller filters
			puts "Creating default http_method permissions
			\n\tGET    permissions: view
			\n\tPOST   permissions: create
			\n\tPUT    permissions: edit
			\n\tPATCH  permissions: edit
			\n\tDELETE permissions: delete"
			ControllerFilter.new(http_method:"get",permissions:[view]).save
			ControllerFilter.new(http_method:"post",permissions:[create]).save
			ControllerFilter.new(http_method:"put",permissions:[edit]).save
			ControllerFilter.new(http_method:"patch",permissions:[edit]).save
			ControllerFilter.new(http_method:"delete",permissions:[delete]).save






			# source_root File.expand_path("../../templates", __FILE__)

			# desc "Creates a Devise initializer and copy locale files to your application."
			# # class_option :orm

			# def copy_initializer
			# template "devise.rb", "config/initializers/devise.rb"
			# end

			# def copy_locale
			# copy_file "../../../config/locales/en.yml", "config/locales/devise.en.yml"
			# end

			# def show_readme
			# readme "README" if behavior == :invoke
			# end

			# def rails_4?
			# Rails::VERSION::MAJOR == 4
			# end
		end
	end
end