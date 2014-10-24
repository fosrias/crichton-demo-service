class DrdsController < ApplicationController
  respond_to(:html, :xhtml, :hale_json, :hal_json)
  
  def show
    @drd = build_drd_object(Drd.find_by_uuid(params[:id]))
    respond_with(@drd, options)
  end
  
  def index
    @drds = build_drds_object(Drds.find(params[:search_term]))
    respond_with(@drds.value, options)
  end
  
  def create
    @drd = build_drd_object(Drd.new(drd_params))
    if @drd.save
      respond_with(@drd, options)
    else
      raise @drd.errors.full_messages
    end
  end
  
  def update
    @drd = build_drd_object(Drd.find_by_uuid(params[:id]))
    
    if @drd.update_attributes(drd_params)
      respond_with(@drd, options)
    else
      raise @drd.errors.full_messages
    end
  end
  
  def destroy
    @drd = build_drd_object(Drd.find_by_uuid(params[:id]))
    @drd.destroy
    respond_with(@drd, options)
  end
  
  def activate
    transition
  end

  def deactivate
    transition
  end
  
  private
  
  def transition
    @drd = build_drd_object(Drd.find_by_uuid(params[:id]))

    if @drd.send(params[:action])
      respond_with(@drd, options)
    else
      raise @drd.errors.full_messages
    end
  end

  def drd_params
    params.slice(:name, :leviathan_uuid, :kind).reject { |_, v| v.blank? }
  end
  
  def options
    (conditions = params[:conditions]) ? {conditions: conditions.split(',').map(&:strip)} : {}
  end
end
