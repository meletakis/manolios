require "test_helper"

class TeamControllerTest < ActionController::TestCase
  setup do
    sign_in users(:bubbles)
    @team = teams(:powerpuff_girls)
    @order = orders(:smoothies)
    @users = User.all - [users(:bubbles)]
  end

  test "get index" do
    get :index
    assert_response :success
    assert_equal [@team], assigns(:teams)
  end

  test "get show" do
    get :show, id: @team
    assert_response :success
    assert_equal [@order], assigns(:orders)
  end

  test "get new" do
    get :new
    assert_response :success
    assert_equal @users, assigns(:users)
  end

  test "get edit" do
    get :edit, id: @team
    assert_response :success
    assert_equal User.all, assigns(:users)
    assert_equal @team, assigns(:team)
  end

  test "post create with valid team" do
    assert_difference 'Team.count' do
      post :create, team: {name: "test", users: @users}
    end
    @new_team = Team.last
    assert_redirected_to team_path(@new_team)
  end

  test "post create with invalid team" do
    assert_no_difference "Team.count" do
      post :create, team: {name: nil, users: @users}
    end
    assert_equal @users, assigns(:users)
    assert_template :new
  end

  test "post update with valid team" do
    post :update, id: @team, team: {name: "test", users: @users}
    assert_redirected_to team_path(@team)
  end

  test "post update with invalid team" do
    post :update, id: @team, team: {name: nil, users: @users}
    assert_equal @users, assigns(:users)
    assert_template :edit
  end

  test "post destroy" do
    post :destroy, id: @team
    assert_redirected_to root_path
  end
end
