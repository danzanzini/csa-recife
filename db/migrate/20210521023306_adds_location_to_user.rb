class AddsLocationToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference(:users, :location, foreign_key: true)
  end
end
