require 'spec_helper'

describe "SiteSetups" do
  describe "GET /site_setups" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get site_setups_path
      response.status.should be(200)
    end
  end
end
