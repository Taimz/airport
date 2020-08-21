class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :passenger, foreign_key: true, index: true
      t.references :flight, foreign_key: true, index: true
      t.timestamps
    end
  end
end
