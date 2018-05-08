class HomeController < ApplicationController
  def index
  end
  def admin
    @users = User.all
  end
end
