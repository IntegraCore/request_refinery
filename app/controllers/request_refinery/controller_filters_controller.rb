require_dependency "request_refinery/application_controller"

module RequestRefinery
  class ControllerFiltersController < ApplicationController
    before_action :set_controller_filter, only: [:show, :edit, :update, :destroy]

    # GET /controller_filters
    def index
      @controller_filters = ControllerFilter.all
    end

    # GET /controller_filters/1
    def show
    end

    # GET /controller_filters/new
    def new
      @controller_filter = ControllerFilter.new
    end

    # GET /controller_filters/1/edit
    def edit
    end

    # POST /controller_filters
    def create
      @controller_filter = ControllerFilter.new(controller_filter_params)

      if @controller_filter.save
        redirect_to @controller_filter, notice: 'Controller filter was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /controller_filters/1
    def update
      if @controller_filter.update(controller_filter_params)
        redirect_to @controller_filter, notice: 'Controller filter was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /controller_filters/1
    def destroy
      @controller_filter.destroy
      redirect_to controller_filters_url, notice: 'Controller filter was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_controller_filter
        @controller_filter = ControllerFilter.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def controller_filter_params
        params.require(:controller_filter).permit(:http_method, :controller, :action_name)
      end
  end
end
