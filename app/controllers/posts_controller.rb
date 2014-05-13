class PostsController < ApplicationController


  
  
  before_filter :blog_active
  load_and_authorize_resource :except => [:index, :show ]
  before_filter :authenticate_user!, :except => [:index, :show ]
  
  before_filter :find_blog, :only => [:show]
  
  def find_blog
    @post = Post.find(params[:id])
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
     end
    
  end

  
  def blog_active
    	  unless user_signed_in? 
           
   
    unless @site_setup.blog_active?
    
    
    redirect_to root_path 
    
    
    end
    
       end
    
    
  end
  
  
  def index
   
    
     if current_user.admin != true
       @posts = Post.all
       
     else
       
       @posts = Post.where("published = ?", true)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
