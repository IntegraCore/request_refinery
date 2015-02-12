module RequestRefinery
  class ApplicationController < Devise::Controllers::Helpers
	before_action :authenticate_user!
	before_action :enforce_request_permissions, except: [:unauthorized_request, :users]

	helper_method :authorized_to?

	include RequestRefinery::ControllerMethods

  end
end
