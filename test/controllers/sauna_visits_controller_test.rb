# frozen_string_literal: true

require 'test_helper'

class SaunaVisitsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get sauna_visits_create_url
    assert_response :success
  end
end
