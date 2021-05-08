class CreateHarvests < ActiveRecord::Migration[6.1]
  def change
    create_table :harvests do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :offering, null: false, foreign_key: true

      t.timestamps
    end
  end
end
