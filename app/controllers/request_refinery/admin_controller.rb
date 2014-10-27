require_dependency "request_refinery/application_controller"

module RequestRefinery
	class AdminController < ApplicationController
		def index
			render json:"testing"
		end
	end
end
