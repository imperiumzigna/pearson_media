# frozen_string_literal: true

require "test_helper"

class StoriesControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  setup do
    @story = stories(:breaking_new)
    sign_in users(:editor_chief)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get new_story_url
    assert_response :success
  end

  test "should create story" do
    assert_difference("Story.count") do
      post stories_url, params: { story: { body: @story.body, headline: @story.headline } }
    end

    assert_redirected_to story_url(Story.last)
  end

  test "should show story" do
    get story_url(@story)
    assert_response :success
  end

  test "should get edit" do
    get edit_story_url(@story)
    assert_response :success
  end

  test "should update story" do
    patch story_url(@story), params: { story: { body: @story.body, deleted_at: @story.deleted_at, headline: @story.headline } }
    assert_redirected_to story_url(@story)
  end

  test "should destroy story" do
    assert_difference("Story.count", -1) do
      delete story_url(@story)
    end

    assert_redirected_to stories_url
  end
end
