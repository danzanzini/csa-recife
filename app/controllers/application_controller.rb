class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_offering

  def current_offering
    Offering.not_closed.by_location(current_user.location).last
  end
end
