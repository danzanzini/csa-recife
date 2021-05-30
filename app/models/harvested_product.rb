class HarvestedProduct < ApplicationRecord
  belongs_to :harvest

  validates :amount, :product_name, presence: true
  validates :amount, numericality: { greater_or_equal_than: 0 }
  # validates :product_name, uniqueness: { scope: :offering_id }

  def self.product_names
    pluck(:product_name)
  end
end
