require "spec_helper"

describe CoffeeItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/coffee_items").should route_to("coffee_items#index")
    end

    it "routes to #new" do
      get("/coffee_items/new").should route_to("coffee_items#new")
    end

    it "routes to #show" do
      get("/coffee_items/1").should route_to("coffee_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coffee_items/1/edit").should route_to("coffee_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coffee_items").should route_to("coffee_items#create")
    end

    it "routes to #update" do
      put("/coffee_items/1").should route_to("coffee_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coffee_items/1").should route_to("coffee_items#destroy", :id => "1")
    end

  end
end
