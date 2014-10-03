module RequestRefinery
  class ApplicationController < ActionController::Base
  	before_action :authenticate_user!
  	before_action :enforce_request_permissions, except: [:unauthorized_request]

	helper_method :authorized_to?

	# returns a boolean indicating whether the user has the permission/permissions in omniParam
	# the intended use is to pass it a symbol or an array of symbols, but there are various other options below:
	# 	omniParam can be a string representing Permission.name, a symbol representing the same, or the actual Permission object
	# 	omniParam can also be an array containg any combination of the aforementioned single parameters
	def authorized_to? omniParam, user:current_user, permissions:nil
		perms = permissions
		perms = user.permission_syms if perms === nil or (!perms.is_a? Array or !perms[0].is_a? Symbol)

		return true if perms.include? :all

		if omniParam.is_a? Symbol
			return perms.include? omniParam
		elsif omniParam.is_a? String
			return perms.include? omniParam.to_sym
		elsif omniParam.is_a? Permission
			return perms.include? omniParam.name.to_sym
		elsif omniParam.is_a? Array
			return omniParam.all?{|x| authorized_to? x,user:user, permissions:perms}
		elsif omniParam.is_a? Permission::ActiveRecord_Associations_CollectionProxy
			return authorized_to? omniParam.to_a, user:user, permissions:perms
		elsif omniParam.is_a? Role	# not going to handle Role because that would weaken the connection between access to a resource and a specific permission
		elsif omniParam.is_a? Hash 	# does not make sense
		elsif omniParam.is_a? User 	# does not make sense
		else
			return false
		end
		return false
	end

	def enforce_request_permissions user:current_user
		# collect the method, controller, and action
		# look for a matching controller filter
		filter = ControllerFilter.where(http_method:request.method.downcase,controller:self.class.to_s,action_name:@_action_name).first

		# handle unauthorized request with unauthorized_request method if filter.blank?
		return unauthorized_request if filter.blank?

		# get the required permissions and user permissions
		# handle unauthorized request with unauthorized_request method unless authorized_to? filter.permissions
		unauthorized_request(filter:filter) unless authorized_to? filter.permissions

		puts "\n\nConfirmed that #{user.email} is authorized to #{filter.http_method.upcase}::>#{filter.controller}.#{filter.action_name}\n\n"
	end

	# can render any page, but a redirect will result in a redirect loop
	def unauthorized_request user:current_user,filter:nil
		puts "\n\nNo filter matches the given http method, controller, and controller method, rerouting..." if filter.blank?
		puts "\n\nUser #{user.email} is not authorized to #{filter.http_method.upcase}::>#{filter.controller}.#{filter.action_name}, rerouting...\n\n" unless filter.blank?
		render json: "Unauthorized Request"
	end

  end
end
