# frozen_string_literal: true

require 'test_helper'

class SaunasControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get saunas_index_url
    assert_response :success
  end

  test 'should get show' do
    get saunas_show_url
    assert_response :success
  end
end
