class AddPriceToVendors < ActiveRecord::Migration[7.2]
  def change
    add_column :vendors, :price, :decimal
  end
end
