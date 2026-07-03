class AddUniqueIgHandleToVendors < ActiveRecord::Migration[7.2]
  def change
    add_index :vendors, [:event_id, :ig_handle], unique: true
  end
end
