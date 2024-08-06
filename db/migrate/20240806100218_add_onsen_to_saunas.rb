class AddOnsenToSaunas < ActiveRecord::Migration[6.1]
  def change
    add_column :saunas, :onsen, :boolean
  end
end
