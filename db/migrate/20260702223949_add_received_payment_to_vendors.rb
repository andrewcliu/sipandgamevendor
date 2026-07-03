class AddReceivedPaymentToVendors < ActiveRecord::Migration[7.2]
  def change
    add_column :vendors, :received_payment, :boolean
  end
end
