class Harvest < ApplicationRecord
  belongs_to :user
  belongs_to :harvest

  has_many :harvested_products
end
