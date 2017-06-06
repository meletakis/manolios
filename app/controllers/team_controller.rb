class TeamController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_user_balance, :current_user_cost

  def index
    @teams = current_user.teams
  end

  def show
    @orders = current_team.orders
  end

  def new
    all_users_except_current
  end

  def edit
    current_team
    @users = User.all
  end

  def create
    @team = current_user.teams.create(team_params)
    if @team.save
      redirect_to @team
    else
      all_users_except_current
      render "new"
    end
  end

  def update
    if current_team.update(team_params)
      redirect_to @team
    else
      all_users_except_current
      render "edit"
    end
  end

  def destroy
    current_team.destroy
    redirect_to root_path
  end

  private

  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end

  def all_users_except_current
    @users ||= User.all_except(current_user)
  end

  def current_team
    @team ||= Team.find(params[:id])
  end

  def current_user_balance(team)
    team.user_team_balances.find_by(current_user.id).balance
  end

  def current_user_cost(order)
    user_order_costs = order.user_order_costs.find_by(current_user.id)
    user_order_costs ? user_order_costs.cost : "0.00"
  end

end
