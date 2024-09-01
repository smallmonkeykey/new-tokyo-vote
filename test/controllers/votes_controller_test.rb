# frozen_string_literal: true

require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test 'should get categories' do
    get votes_categories_url
    assert_response :success
  end

  test 'should get completions' do
    get votes_completions_url
    assert_response :success
  end
end
