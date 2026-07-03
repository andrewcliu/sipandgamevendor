class ChangeDepositPaidToDecimalInVendors < ActiveRecord::Migration[7.2]
  def change
    remove_column :vendors, :deposit_paid, :boolean

    # 2. Add it back as a decimal with proper currency formatting scales
    add_column :vendors, :deposit_paid, :decimal, precision: 8, scale: 2, default: 0.0
  end
end
