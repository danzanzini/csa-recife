class Harvest < ApplicationRecord
  belongs_to :user
  belongs_to :offering

  has_many :harvested_products

  accepts_nested_attributes_for :harvested_products

  def self.new_from(offering)
    new(
      harvested_products: products_from(offering.offers_list),
      offering: offering
    )
  end

private
  def self.products_from(offers_list)
    offers_list.map do |offer_item|
      HarvestedProduct.new(product_name: offer_item, amount: 0)
    end
  end
end
