class CreateRequestRefineryControllerFilters < ActiveRecord::Migration
  def change
    create_table :request_refinery_controller_filters do |t|
      t.string :http_method
      t.string :controller
      t.string :action_name

      t.timestamps
    end

    create_table :request_refinery_controller_filters_permissions do |t|
      t.belongs_to :controller_filter
      t.belongs_to :permission

      t.timestamps
    end
  end
end
