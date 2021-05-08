class CreateHarvestedProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :harvested_products, id: false do |t|
      t.belongs_to :harvest
      t.belongs_to :product
      t.integer :amount

      t.timestamps
    end
  end
end
