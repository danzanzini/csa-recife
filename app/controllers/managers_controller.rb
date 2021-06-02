class ManagersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = Manager.order(first_name: :asc)
  end

  def show
  end

  def new
    @user = Manager.new
  end

  def edit
  end

  def create
    @user = Manager.new(manager_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to managers_path, notice: "Gestor adicionar com sucesso." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(manager_params)
        format.html { redirect_to managers_path, notice: "Gestor atualizado com sucesso." }
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
      @user = Manager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manager_params
      params.require(:manager).permit(
        :first_name, :last_name, :email, :location_id, :items_per_harvest, :role
      )
    end
end
