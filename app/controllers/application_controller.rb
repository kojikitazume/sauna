class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:index, :show, :home] # home はログインなしでアクセス可能なアクション
end  
