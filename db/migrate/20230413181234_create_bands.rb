class CreateBands < ActiveRecord::Migration[7.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.string :country
      t.string :city
      t.string :state
      t.string :website
      t.string :facebook
      t.float :price
      t.timestamps
    end
  end
end
