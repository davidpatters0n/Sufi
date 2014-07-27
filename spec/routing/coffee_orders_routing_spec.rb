require "spec_helper"

describe CoffeeOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/coffee_orders").should route_to("coffee_orders#index")
    end

    it "routes to #new" do
      get("/coffee_orders/new").should route_to("coffee_orders#new")
    end

    it "routes to #show" do
      get("/coffee_orders/1").should route_to("coffee_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coffee_orders/1/edit").should route_to("coffee_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coffee_orders").should route_to("coffee_orders#create")
    end

    it "routes to #update" do
      put("/coffee_orders/1").should route_to("coffee_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coffee_orders/1").should route_to("coffee_orders#destroy", :id => "1")
    end

  end
end
