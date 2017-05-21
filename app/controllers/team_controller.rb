class TeamController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = User.find(current_user.id).teams
  end

  def show
    @team = Team.find(params[:id])
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
      params.require(:team).permit(:name, :user_ids => [])
    end
end
