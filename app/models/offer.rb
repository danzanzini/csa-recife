class Offer < ApplicationRecord
  belongs_to :offering
  belongs_to :product, optional: true

  validates :amount, :product_name, presence: true
  validates :amount, numericality: { greater_than: 0}
  validates :product_name, uniqueness: { scope: :offering_id }
end
