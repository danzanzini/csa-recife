module HarvestsHelper
  def available_amount_for(product_name)
    current_offering.available_amount_for(product_name)
  end
end
