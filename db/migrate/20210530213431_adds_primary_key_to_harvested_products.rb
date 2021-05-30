class AddsPrimaryKeyToHarvestedProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :harvested_products, :id, :primary_key
  end
end
