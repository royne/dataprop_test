class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @properties = current_user.properties
  end
end
