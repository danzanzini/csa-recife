class UsersController < ApplicationController
  before_action :set_user, only: %i[ toggle_active ]

  def toggle_active
    @user.update!(active: !@user.active)

    redirect_to by_role_path(@user)
  end

  def edit_password
  end

  def update
    if current_user.update(password_params)
      redirect_to root_path, notice: 'Password alterado com sucesso'
    else
      render :edit_password, status: :unprocessable_entity
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def by_role_path(user)
    if @user.supporter?
      edit_supporter_path(user)
    else
      managers_path(user)
    end
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
