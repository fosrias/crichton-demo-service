class ApplicationController < ActionController::Base
  include ServiceObject
  protect_from_forgery
end
