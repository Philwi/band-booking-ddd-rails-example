class CreateVenueBooking < ActiveRecord::Migration[7.0]
  def change
    create_table :venue_bookings do |t|
      t.numeric :venue_id
      t.date :date

      t.timestamps
    end
  end
end
