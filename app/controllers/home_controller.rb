class HomeController < ApplicationController
  def index
    @users = User.all
    @message = Message.new
  end
end
