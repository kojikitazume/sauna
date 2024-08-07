class AddFeaturedToSaunas < ActiveRecord::Migration[6.1]
  def change
    add_column :saunas, :featured, :boolean
  end
end
