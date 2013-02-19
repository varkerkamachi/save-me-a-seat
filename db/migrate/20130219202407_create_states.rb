class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :id
      t.references :country
      t.string :name

      t.timestamps
    end
  end
end
