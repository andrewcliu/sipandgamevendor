class CreateVendors < ActiveRecord::Migration[7.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :ig_handle
      t.boolean :deposit_paid
      t.integer :total_tables
      t.text :notes
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
