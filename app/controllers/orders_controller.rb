class OrdersController < ApplicationController
  before_action :fetch_team 
  helper_method :order_cost

  def show
  end

  def new
    @order = @team.orders.build
  end

  def create
    @order = @team.orders.build(order_params)
    if @order.save
      redirect_to [@team, @order]
    else
      render "new"
    end
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  private

    def order_params
      params.require(:order).permit()
    end

  	def fetch_order
      @order = Order.find(params[:id])
    end

    def fetch_team
      @team = Team.find(params[:team_id])
    end

  	def order_cost(user)
  		@order.user_order_costs.find_by(user: user).cost
  	end 
end
