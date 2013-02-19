class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :id
      t.references :country
      t.references :state
      t.string :name

      t.timestamps
    end
  end
end
