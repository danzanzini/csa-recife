module HarvestsHelper
  def available_amount_for(product_name)
    current_offering.available_amount_for(product_name)
  end

  def ordered_products(products)
    products.sort { |a, b| a.product_name <=> b.product_name }
  end
end
