class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers, id: false do |t|
      t.belongs_to :offering
      t.belongs_to :product
      t.integer :amount

      t.timestamps
    end
  end
end
