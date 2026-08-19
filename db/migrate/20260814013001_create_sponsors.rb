class CreateSponsors < ActiveRecord::Migration[7.2]
  def change
    create_table :sponsors do |t|
      t.string :company_name
      t.string :representative_name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
