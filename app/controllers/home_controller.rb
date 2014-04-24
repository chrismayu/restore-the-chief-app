class HomeController < ApplicationController
  def index
    @users = User.all
    @message = Message.new
    @recent_post = Post.first(3)
  
  end
end
