module OfferingsHelper

  def seven_days_from_now
    (Time.zone.today..Time.zone.today + 7).map do |day|
      [I18n.l(day, format: '%A, %d/%m'), day.strftime('%d-%m-%Y')]
    end
  end

  def publish_button_class(offering)
    'disabled' if offering.closed? || offering.published
  end

  def ordered_products(products)
    products.sort { |a, b| a.product_name <=> b.product_name }
  end

  def products_and_count(harvest)
    harvest.harvested_products.with_amount.map do |hp|
      "#{hp.product_name} (#{hp.amount})"
    end.join(', ')
  end
end
