module OfferingsHelper

  def seven_days_from_now
    (Date.today..Date.today+6).map do |day|
      [day.strftime('%A, %d/%m'), day.strftime('%d-%m')]
    end
  end
end
