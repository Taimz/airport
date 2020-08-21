class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :capacity
      t.timestamp :date
      t.string :destination

      t.timestamps
    end
  end
end
