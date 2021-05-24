class Offer < ApplicationRecord
  belongs_to :offering
  belongs_to :product, optional: true

  before_validation :normalize_product_name

  validates :amount, :product_name, presence: true
  validates :amount, numericality: { greater_than: 0}
  validates :product_name, uniqueness: { scope: :offering_id }

private

  def normalize_product_name
    self.product_name = product_name&.humanize
  end
end
