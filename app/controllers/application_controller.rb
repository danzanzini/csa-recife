class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_offering, :current_harvest

  def current_offering
    Offering.not_closed.by_location(current_user.location).published.last
  end

  def current_harvest
    current_offering&.harvested_by(current_user)
  end
end
