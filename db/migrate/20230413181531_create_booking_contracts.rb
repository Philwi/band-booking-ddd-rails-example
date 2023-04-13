class CreateBookingContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_contracts do |t|
      t.numeric :band_id
      t.numeric :venue_id
      t.float :price
      t.string :date
      t.string :time
      t.string :duration
      t.string :status

      t.timestamps
    end
  end
end
