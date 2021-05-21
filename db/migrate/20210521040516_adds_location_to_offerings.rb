class AddsLocationToOfferings < ActiveRecord::Migration[6.1]
  def change
    add_reference(:offerings, :location, foreign_key: true)
  end
end
