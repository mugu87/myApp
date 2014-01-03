require "spec_helper"

describe CausesController do
  describe "routing" do

    it "routes to #index" do
      get("/causes").should route_to("causes#index")
    end

    it "routes to #new" do
      get("/causes/new").should route_to("causes#new")
    end

    it "routes to #show" do
      get("/causes/1").should route_to("causes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/causes/1/edit").should route_to("causes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/causes").should route_to("causes#create")
    end

    it "routes to #update" do
      put("/causes/1").should route_to("causes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/causes/1").should route_to("causes#destroy", :id => "1")
    end

  end
end
