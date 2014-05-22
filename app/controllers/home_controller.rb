class HomeController < ApplicationController
  def index
    @users = User.all
    @message = Message.new
    @recent_post = Post.where(:published => true, :display_date => Date.today-500.year..Date.today).first(3)
  end
end
