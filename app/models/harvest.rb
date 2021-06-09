class Harvest < ApplicationRecord
  belongs_to :user
  belongs_to :offering

  has_many :harvested_products

  scope :by_user, -> (user) { where(user: user) }
  scope :ordered_by_user, -> { joins(:user).order('users.first_name asc') }

  accepts_nested_attributes_for :harvested_products

  validate :user_amount

  def self.new_from(offering)
    new(
      harvested_products: products_from(offering.offers_list),
      offering: offering
    )
  end

private
  def self.products_from(offers_list)
    offers_list.map do |offer_item|
      HarvestedProduct.new(product_name: offer_item)
    end
  end

  def user_amount
    total_amount = harvested_products.reduce(0){ |sum, hp| sum + hp.amount.to_i }

    if total_amount > user.items_per_harvest
      errors.add(:base, "Você escolheu mais itens que o disponível")
    end
  end
end
