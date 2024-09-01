# frozen_string_literal: true

require 'test_helper'

class VoteControllerTest < ActionDispatch::IntegrationTest
  test 'should get categories' do
    get vote_categories_url
    assert_response :success
  end

  test 'should get completions' do
    get vote_completions_url
    assert_response :success
  end
end
