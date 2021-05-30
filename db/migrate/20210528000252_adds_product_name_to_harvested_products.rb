class AddsProductNameToHarvestedProducts < ActiveRecord::Migration[6.1]
  def change
    add_column(:harvested_products, :product_name, :string)
  end
end
