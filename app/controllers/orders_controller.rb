class OrdersController < ApplicationController
  respond_to :html, :xhtml

  def show
    @order = Order.find_by_uuid(params[:id])
    respond_with(@order, options)
  end

  def index
    @orders = Orders.find(params[:search_term])
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
    @order = Order.find_by_uuid(params[:id])

    if @order.update_attributes(order_params)
      respond_with(@order, options)
    else
      raise @order.errors.full_messages
    end
  end

  def destroy
    @order = Order.find_by_uuid(params[:id])
    @order.destroy
    respond_with(@order, options)
  end

  def ship
    @order = Order.find_by_uuid(params[:id])

    if @order.update_attributes(order_params.merge({status: :shipped}))
      respond_with(@order, options)
    else
      raise @order.errors.full_messages
    end
  end

  def deliver
    @order = Order.find_by_uuid(params[:id])

    if @order.update_attributes(order_params.merge({status: :delivered}))
      respond_with(@order, options)
    else
      raise @order.errors.full_messages
    end
  end

  private
  def order_params
    params.slice(:name, :email, :status, :quantity, :address, :express).reject { |_, v| v.blank? }
  end

  def options
    (conditions = params[:conditions]) ? {conditions: conditions.split(',').map(&:strip)} : {}
  end
end
