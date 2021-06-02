class SupportersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = Supporter.order(first_name: :asc)
  end

  def show
  end

  def new
    @user = Supporter.new(role: 'supporter')
  end

  def edit
  end

  def create
    @user = Supporter.new(supporter_params)
    @user.role = 'supporter'

    respond_to do |format|
      if @user.save
        format.html { redirect_to supporters_path, notice: "Apoiador adicionado com sucesso." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(supporter_params)
        format.html { redirect_to supporters_path, notice: "Apoiador editado com sucesso." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Supporter.supporter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supporter_params
      params.require(:supporter).permit(
        :first_name, :last_name, :email, :location_id, :items_per_harvest
      )
    end
end
