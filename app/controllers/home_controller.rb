class HomeController < ApplicationController
  def index
    flash.now[:notice] = 'Logged in Successfully'
    flash.now[:alert] = 'Invalid email or password'
  end

  def about
  end
end
