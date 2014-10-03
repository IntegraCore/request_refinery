module RequestRefinery
	class User < ActiveRecord::Base
		# Include default devise modules. Others available are:
		# :confirmable, :lockable, :timeoutable and :omniauthable
		devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

		before_create :initialize_username
		before_save	:initialize_username

		has_and_belongs_to_many :permissions
		has_and_belongs_to_many :restrictions, :class_name => "Permission", :join_table => "request_refinery_inverse_users_restrictions"
		has_and_belongs_to_many :roles
		has_and_belongs_to_many :customers

		validates :email, presence: true, uniqueness: true
		validates :password, presence: true

		def initialize_username
			self.username = self.email if self.username.blank? or User.where(username:self.username).count > 0
		end

		def permissions
			# get permissions from Permissions and Roles, account for the :all permission
			p = super
			self.roles.each{|x| p += x.permissions}	# parse permissions from the user's roles
			p_a = p.to_a
			(p_a = Permission.all.to_a) if p.any? {|x| x.name == "all"}	# if they have the all permissions, give them all permissions

			# get restrictions
			r = self.restrictions
			r_a = r.to_a

			# remove restrictions from the permissions
			p_s = Set.new(p_a) - Set.new(r_a)

			return p_s.to_a
		end

		def permission_syms
			self.permissions.collect{|x| x.name.to_sym}
		end

		def permission_strings
			self.permissions.collect{|x| x.name}
		end

	end
end
