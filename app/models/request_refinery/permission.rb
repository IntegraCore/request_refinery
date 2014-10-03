module RequestRefinery
	class Permission < ActiveRecord::Base
		has_and_belongs_to_many :roles
		has_and_belongs_to_many :users
		has_and_belongs_to_many :inverse_roles, :class_name => "Role", :join_table => "request_refinery_restrictions_inverse_roles"
		has_and_belongs_to_many :inverse_users, :class_name => "User", :join_table => "request_refinery_inverse_users_restrictions"
		has_and_belongs_to_many :controller_filters

		validates :name, presence: true, uniqueness: true
	end
end
