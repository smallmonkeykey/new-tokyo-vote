# frozen_string_literal: true

require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get categories' do
    get entries_categories_url
    assert_response :success
  end

  test 'should get new' do
    get entries_new_url
    assert_response :success
  end

  test 'should get completions' do
    get entries_completions_url
    assert_response :success
  end
end
