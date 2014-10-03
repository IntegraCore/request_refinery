module RequestRefinery
	class Role < ActiveRecord::Base
		has_and_belongs_to_many :permissions
		has_and_belongs_to_many :users
		has_and_belongs_to_many :restrictions, :class_name => "Permission", :join_table => "request_refinery_restrictions_inverse_roles"

		validates :group, presence: true, uniqueness: true
	end
end
