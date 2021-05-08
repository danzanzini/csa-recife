class CreateOfferings < ActiveRecord::Migration[6.1]
  def change
    create_table :offerings do |t|
      t.datetime :closes_at
      t.boolean :published

      t.timestamps
    end
  end
end
