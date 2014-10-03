class CreateRequestRefineryPermissions < ActiveRecord::Migration
  def change
    create_table :request_refinery_roles do |t|
      t.string :group

      t.timestamps
    end
    add_index :request_refinery_roles, :group, unique: true

    create_table :request_refinery_permissions do |t|
      t.string :name

      t.timestamps
    end
    add_index :request_refinery_permissions, :name, unique: true

    create_table :request_refinery_permissions_roles, id:false do |t|
      t.belongs_to :role
      t.belongs_to :permission

      t.timestamps
    end

    create_table :request_refinery_restrictions_inverse_roles, id:false do |t|
      t.belongs_to :role
      t.belongs_to :permission

      t.timestamps
    end
  end
end
