class OffersController < ApplicationController
  before_action :set_offering
  before_action :set_offer, only: [:update, :destroy]

  def create
    @offer = @offering.offers.build(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offering, notice: "Offer was successfully added." }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render 'offerings/show', status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @offer.destroy!
    redirect_to(
      offering_url(@offering),
      notice: "Offer was successfully destroyed."
    )
  end

private
  def set_offering
    @offering = Offering.find(params[:offering_id])
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:product_name, :amount)
  end
end
