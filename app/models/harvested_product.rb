class HarvestedProduct < ApplicationRecord
  belongs_to :harvest

  scope :with_amount, -> { where('amount > 0') }

  validates :product_name, presence: true
  validates :amount, numericality: { greater_or_equal_than: 0 }, allow_blank: true
  # validates :product_name, uniqueness: { scope: :offering_id }

  validate :amount_is_available

  delegate :offering, to: :harvest, allow_nil: true

  def self.product_names
    pluck(:product_name)
  end

private
  def amount_is_available
    if amount
      if offering.available_amount_for(product_name) < amount
        errors.add(:amount,
          message: 'Não há quantidade disponível para este produto'
        )
      end
    end
  end
end
