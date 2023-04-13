class CreateVenue < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.float :price
      t.numeric :capacity
      t.string :address
      t.string :city
      t.string :country
      t.string :description
      t.string :email
      t.string :facebook
      t.string :name
      t.string :phone
      t.string :state
      t.string :website

      t.timestamps
    end
  end
end
