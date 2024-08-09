# frozen_string_literal: true

class UsersController < ApplicationController
  def guest_login
    user = User.find_or_create_by(email: 'guest@example.com') do |u|
      u.password = 'password'
      u.password_confirmation = 'password'
    end
    sign_in(user)
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
