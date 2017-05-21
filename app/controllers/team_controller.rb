class TeamController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = User.find(current_user.id).teams
    @user_team_balances = UserTeamBalance.find(current_user.id)
  end
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
    else
      render "new"
    end
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end
end
