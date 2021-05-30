class HarvestedProduct < ApplicationRecord
  belongs_to :harvest

  validates :amount, :product_name, presence: true
  validates :amount, numericality: { greater_or_equal_than: 0 }
  # validates :product_name, uniqueness: { scope: :offering_id }

  validate :amount_is_available

  delegate :offering, to: :harvest, allow_nil: true

  def self.product_names
    pluck(:product_name)
  end

private
  def amount_is_available
    if offering.available_amount_for(product_name) < amount
      errors.add(:product_name,
        message: 'Não há quantidade disponível para este produto'
      )
      errors.add(:amount,
        message: 'Não há quantidade disponível para este produto'
      )
    end
  end
end
