class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @sauna_visits = @user.sauna_visits # ユーザーのサ活履歴を取得
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:avatar, :bio)
  end
end
