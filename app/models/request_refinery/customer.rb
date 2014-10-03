module RequestRefinery
	class Customer < ActiveRecord::Base
		has_and_belongs_to_many :users
	end
end
