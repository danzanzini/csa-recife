class AddsItemsPerHarvestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column(:users, :items_per_harvest, :integer)
  end
end
