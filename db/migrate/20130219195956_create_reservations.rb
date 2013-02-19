class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :id
      t.references :location_start
      t.references :location_end
      t.integer :passengers
      t.timestamp :departure_date
      t.timestamp :return_date

      t.timestamps
    end
  end
end
