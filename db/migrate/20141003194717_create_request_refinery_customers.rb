class CreateRequestRefineryCustomers < ActiveRecord::Migration
  def change
    create_table :request_refinery_customers do |t|
      t.string :cust_id
      t.string :prefix
      t.string :folder_name
      t.string :error_email_recipients

      t.timestamps
    end
  end
end
