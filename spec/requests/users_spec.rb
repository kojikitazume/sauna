require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /guest_login" do
    it "returns http success" do
      get "/users/guest_login"
      expect(response).to have_http_status(:success)
    end
  end

end
