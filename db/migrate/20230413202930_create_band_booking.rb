class CreateBandBooking < ActiveRecord::Migration[7.0]
  def change
    create_table :band_bookings do |t|
      t.numeric :band_id
      t.numeric :venue_id
      t.string :date

      t.timestamps
    end
  end
end
