class TeamController < ApplicationController
  before_action :authenticate_user!

  def index
    @teams = User.find(current_user.id).teams
  end

  def show
    current_team
  end

  def new
    @team = Team.new
    all_users_except_current
  end

  def edit
    current_team
    all_users_except_current
  end

  def create
    @team = current_user.teams.create(team_params)
    if @team.save
      redirect_to @team
    else
      render "new"
    end
  end

  def update
    current_team
    if current_team.update(team_params)
      current_team.user_team_balances.build(:user => current_user)
      redirect_to @team
    else
      render "edit" 
    end
  end

  def destroy
    current_team
    @team.destroy
 
    redirect_to root_path
  end

  private
    def team_params
      params.require(:team).permit(:name, :user_ids => [])
    end

    def all_users_except_current
      @users = User.all_except(current_user)
    end

    def current_team
      @team = Team.find(params[:id])
    end
end
