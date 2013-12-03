class OrdersController < ApplicationController
  respond_to :html, :xhtml

  def show
    @order = Order.find_by_uuid(params[:id])
    respond_with(@order, options)
  end

  def index
    @orders = Orders.find(order_params)
    respond_with(@orders, options)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      respond_with(@order, options)
    else
      raise @order.errors.full_messages
    end
  end

  def update
    status_transition(order_params)
  end

  def destroy
    @order = Order.find_by_uuid(params[:id])
    @order.destroy
    respond_with(@order, options)
  end

  def ship
    status_transition(order_params.merge({status: :shipped}))
  end

  def deliver
    status_transition(order_params.merge({status: :delivered}))
  end

  def cancel
    status_transition(order_params.merge({status: :cancelled}))
  end

  private
  def status_transition(options)
    @order = Order.find_by_uuid(params[:id])

    if @order.update_attributes(options)
      respond_with(@order, options)
    else
      raise @order.errors.full_messages
    end
  end

  def order_params
    params.slice(:name, :email, :status, :quantity, :address, :express).reject { |_, v| v.blank? }
  end

  def options
    (conditions = params[:conditions]) ? {conditions: conditions.split(',').map(&:strip)} : {}
  end
end
