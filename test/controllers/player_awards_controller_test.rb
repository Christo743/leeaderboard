require 'test_helper'

class PlayerAwardsControllerTest < ActionController::TestCase
  setup do
    @player_award = player_awards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_awards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_award" do
    assert_difference('PlayerAward.count') do
      post :create, player_award: { award_id: @player_award.award_id, player_id: @player_award.player_id }
    end

    assert_redirected_to player_award_path(assigns(:player_award))
  end

  test "should show player_award" do
    get :show, id: @player_award
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_award
    assert_response :success
  end

  test "should update player_award" do
    patch :update, id: @player_award, player_award: { award_id: @player_award.award_id, player_id: @player_award.player_id }
    assert_redirected_to player_award_path(assigns(:player_award))
  end

  test "should destroy player_award" do
    assert_difference('PlayerAward.count', -1) do
      delete :destroy, id: @player_award
    end

    assert_redirected_to player_awards_path
  end
end
