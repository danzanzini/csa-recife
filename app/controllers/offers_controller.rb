class OffersController < ApplicationController
  before_action :set_offering

  def create
  end

  def update
  end

  def destroy
  end

private
  def set_offering
    @offering = Offering.find(params[:offering_id])
  end
end
