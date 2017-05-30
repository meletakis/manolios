class OrdersController < ApplicationController
  helper_method :order_cost

  def show
  	current_order
  end

  def new
    @order = Order.new
    @team_users = current_team.users
  end

  def edit
    current_team
    all_users_except_current
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      redirect_to @order
    else
      render "new"
    end
  end

  def update
    current_team
    if current_team.update(team_params)
      current_team.user_team_balances.build(:user => current_user)
      redirect_to @order
    else
      render "edit"
    end
  end

  def destroy
    current_team
    @order.destroy
    redirect_to root_path
  end

  private
    def team_params
      params.require(:team).permit(:name, user_ids: [])
    end

  private
  	def current_order
      @order = Order.find(params[:id])
    end

  	def order_cost(user)
  		current_order.user_order_costs.find_by(user: user).cost
  	end 
end
