class CreateSaunaVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :sauna_visits do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sauna, null: false, foreign_key: true
      t.integer :sauna_time
      t.integer :water_time
      t.integer :cooldown_time
      t.text :comment

      t.timestamps
    end
  end
end
