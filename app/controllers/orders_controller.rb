class OrdersController < ApplicationController
  helper_method :order_cost

  def show
  	current_order
  end

  private

  def current_order
    @order = Order.find(params[:id])
  end

  def order_cost(user)
    current_order.user_order_costs.find_by(user: user).cost
  end
end
