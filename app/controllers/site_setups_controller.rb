class SiteSetupsController < ApplicationController
  # GET /site_setups
  # GET /site_setups.json
  
  load_and_authorize_resource #:except => [:index, :show ]
  before_filter :authenticate_user! #, :except => [:index, :show ]
  
  def index
    @site_setups = SiteSetup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @site_setups }
    end
  end

  # GET /site_setups/1
  # GET /site_setups/1.json
  def show
    @site_setup = SiteSetup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_setup }
    end
  end

  # GET /site_setups/new
  # GET /site_setups/new.json
  def new
    @site_setup = SiteSetup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site_setup }
    end
  end

  # GET /site_setups/1/edit
  def edit
    @site_setup = SiteSetup.find(params[:id])
  end

  # POST /site_setups
  # POST /site_setups.json
  def create
    @site_setup = SiteSetup.new(params[:site_setup])

    respond_to do |format|
      if @site_setup.save
        format.html { redirect_to @site_setup, notice: 'Site setup was successfully created.' }
        format.json { render json: @site_setup, status: :created, location: @site_setup }
      else
        format.html { render action: "new" }
        format.json { render json: @site_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /site_setups/1
  # PUT /site_setups/1.json
  def update
    @site_setup = SiteSetup.find(params[:id])

    respond_to do |format|
      if @site_setup.update_attributes(params[:site_setup])
        format.html { redirect_to @site_setup, notice: 'Site setup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_setups/1
  # DELETE /site_setups/1.json
  def destroy
    @site_setup = SiteSetup.find(params[:id])
    @site_setup.destroy

    respond_to do |format|
      format.html { redirect_to site_setups_url }
      format.json { head :no_content }
    end
  end
end
