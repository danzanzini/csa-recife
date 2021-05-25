class UsersController < ApplicationController
  before_action :set_user, only: %i[ toggle_active ]

  def toggle_active
    @user.update!(active: !@user.active)

    redirect_to by_role_path(@user)
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
end
