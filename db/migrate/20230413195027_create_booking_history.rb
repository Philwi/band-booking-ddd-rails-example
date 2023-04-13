class CreateBookingHistory < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_histories do |t|
      t.string :band_name
      t.string :venue_name
      t.float :price
      t.string :date
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
