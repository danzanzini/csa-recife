class OfferingsController < ApplicationController
  before_action :set_offering, only: %i[ show edit update destroy publish]

  # GET /offerings or /offerings.json
  def index
    @offerings = Offering.order(closes_at: :desc)
  end

  # GET /offerings/1 or /offerings/1.json
  def show
    @offer = @offering.offers.build
  end

  # GET /offerings/new
  def new
    @offering = Offering.new
  end

  # GET /offerings/1/edit
  def edit
  end

  # POST /offerings or /offerings.json
  def create
    @offering = Offering.new(offering_params)

    respond_to do |format|
      if @offering.save
        format.html { redirect_to @offering, notice: "Offering was successfully created." }
        format.json { render :show, status: :created, location: @offering }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offerings/1 or /offerings/1.json
  def update
    respond_to do |format|
      if @offering.update(offering_params)
        format.html { redirect_to @offering, notice: "Offering was successfully updated." }
        format.json { render :show, status: :ok, location: @offering }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offerings/1 or /offerings/1.json
  def destroy
    @offering.destroy
    respond_to do |format|
      format.html { redirect_to offerings_url, notice: "Offering was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def publish
    @offering.publish!
    redirect_to @offering, notice: "Oferenda publicada com sucesso."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offering
      @offering = Offering.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offering_params
      params.require(:offering).permit(
        :location_id, :closes_at_date, :closes_at_time, :closes_at
      )
    end
end
