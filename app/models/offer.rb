class Offer < ApplicationRecord
  belongs_to :offering
  belongs_to :product, optional: true

  validates :amount, :product_name, presence: true
end
