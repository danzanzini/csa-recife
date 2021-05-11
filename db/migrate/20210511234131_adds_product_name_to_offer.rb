class AddsProductNameToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column(:offers, :product_name, :string)
  end
end
