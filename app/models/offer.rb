class Offer < ApplicationRecord
  belongs_to :offering
  belongs_to :product, optional: true

  before_validation :normalize_product_name

  scope :with_amount, -> { where('amount > 0') }

  validates :product_name, presence: true
  validates :amount, numericality: { greater_or_equal_than: 0 }, allow_blank: true
  validates :product_name, uniqueness: { scope: :offering_id }

  def self.product_names
    pluck(:product_name).uniq
  end

  def self.default_set
    product_names.sort.map { |product| new(product_name: product) }
  end

private

  def normalize_product_name
    self.product_name = product_name&.humanize
  end
end
