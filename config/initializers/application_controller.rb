class ApplicationController < ActionController::Base
  	before_action :authenticate_request_refinery_user!
  	before_action :enforce_request_permissions, except: [:unauthorized_request]

	helper_method :authorized_to?

	# RequestRefinery::Engine.load_seed
	include RequestRefinery::ControllerMethods
end
