module OfferingsHelper

  def seven_days_from_now
    (Date.today..Date.today+7).map do |day|
      [I18n.l(day, format: '%A, %d/%m'), day.strftime('%d-%m')]
    end
  end

  def publish_button_class(offering)
    'disabled' if offering.closed? || offering.published
  end
end
