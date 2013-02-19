class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :id
      t.references :city
      t.references :state
      t.references :country
      t.float :geoX
      t.float :geoY

      t.timestamps
    end
  end
end
