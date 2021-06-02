class Offer < ApplicationRecord
  belongs_to :offering
  belongs_to :product, optional: true

  before_validation :normalize_product_name

  validates :amount, :product_name, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :product_name, uniqueness: { scope: :offering_id }

  def self.product_names
    pluck(:product_name)
  end

  def self.default_set
    pluck(:product_name).sort.map { |product| new(product_name: product) }
  end

private

  def normalize_product_name
    self.product_name = product_name&.humanize
  end
end
