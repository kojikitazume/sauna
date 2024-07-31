class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      t.string :name
      t.string :location
      t.integer :sauna_temperature
      t.integer :water_temperature

      t.timestamps
    end
  end
end
