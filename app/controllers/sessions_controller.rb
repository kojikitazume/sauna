# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:guest_login]

  def guest_login
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.hex(10) # 仮のパスワードを設定
      user.password_confirmation = user.password
    end
    sign_in(user)
    redirect_to root_path, notice: 'ゲストとしてログインしました。'
  end
end
