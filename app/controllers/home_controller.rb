class HomeController < ApplicationController
  def index
    @users = User.all
    @message = Message.new
    @recent_post = Post.where(:published => true).select{|post| post.display_date.to_date >= DateTime.now}.first(3)
  
  end
end
