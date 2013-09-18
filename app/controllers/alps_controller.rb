class AlpsController < ApplicationController
  def show
    profile = Crichton.raw_profile_registry[params[:id]]
    render xml: profile
  end
end
