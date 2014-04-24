require "spec_helper"

describe SiteSetupsController do
  describe "routing" do

    it "routes to #index" do
      get("/site_setups").should route_to("site_setups#index")
    end

    it "routes to #new" do
      get("/site_setups/new").should route_to("site_setups#new")
    end

    it "routes to #show" do
      get("/site_setups/1").should route_to("site_setups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/site_setups/1/edit").should route_to("site_setups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/site_setups").should route_to("site_setups#create")
    end

    it "routes to #update" do
      put("/site_setups/1").should route_to("site_setups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/site_setups/1").should route_to("site_setups#destroy", :id => "1")
    end

  end
end
