# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[index show home] # home はログインなしでアクセス可能なアクション
end
