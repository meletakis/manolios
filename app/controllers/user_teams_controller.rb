class UserTeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = User.find(current_user.id).teams
    @user_team_balances = UserTeamBalance.find(current_user.id)
  end
end
