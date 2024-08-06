class AddDetailsToSaunas < ActiveRecord::Migration[6.1]
  def change
    add_column :saunas, :description, :text
    add_column :saunas, :rolyu, :boolean, default: false
    add_column :saunas, :aufguss, :boolean, default: false
    add_column :saunas, :has_hot_spring, :boolean, default: false
  end
end
