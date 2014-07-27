require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CoffeeItemsController do

  # This should return the minimal set of attributes required to create a valid
  # CoffeeItem. As you add validations to CoffeeItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CoffeeItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all coffee_items as @coffee_items" do
      coffee_item = CoffeeItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:coffee_items).should eq([coffee_item])
    end
  end

  describe "GET show" do
    it "assigns the requested coffee_item as @coffee_item" do
      coffee_item = CoffeeItem.create! valid_attributes
      get :show, {:id => coffee_item.to_param}, valid_session
      assigns(:coffee_item).should eq(coffee_item)
    end
  end

  describe "GET new" do
    it "assigns a new coffee_item as @coffee_item" do
      get :new, {}, valid_session
      assigns(:coffee_item).should be_a_new(CoffeeItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested coffee_item as @coffee_item" do
      coffee_item = CoffeeItem.create! valid_attributes
      get :edit, {:id => coffee_item.to_param}, valid_session
      assigns(:coffee_item).should eq(coffee_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CoffeeItem" do
        expect {
          post :create, {:coffee_item => valid_attributes}, valid_session
        }.to change(CoffeeItem, :count).by(1)
      end

      it "assigns a newly created coffee_item as @coffee_item" do
        post :create, {:coffee_item => valid_attributes}, valid_session
        assigns(:coffee_item).should be_a(CoffeeItem)
        assigns(:coffee_item).should be_persisted
      end

      it "redirects to the created coffee_item" do
        post :create, {:coffee_item => valid_attributes}, valid_session
        response.should redirect_to(CoffeeItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved coffee_item as @coffee_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        CoffeeItem.any_instance.stub(:save).and_return(false)
        post :create, {:coffee_item => {  }}, valid_session
        assigns(:coffee_item).should be_a_new(CoffeeItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        CoffeeItem.any_instance.stub(:save).and_return(false)
        post :create, {:coffee_item => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested coffee_item" do
        coffee_item = CoffeeItem.create! valid_attributes
        # Assuming there are no other coffee_items in the database, this
        # specifies that the CoffeeItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CoffeeItem.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => coffee_item.to_param, :coffee_item => { "these" => "params" }}, valid_session
      end

      it "assigns the requested coffee_item as @coffee_item" do
        coffee_item = CoffeeItem.create! valid_attributes
        put :update, {:id => coffee_item.to_param, :coffee_item => valid_attributes}, valid_session
        assigns(:coffee_item).should eq(coffee_item)
      end

      it "redirects to the coffee_item" do
        coffee_item = CoffeeItem.create! valid_attributes
        put :update, {:id => coffee_item.to_param, :coffee_item => valid_attributes}, valid_session
        response.should redirect_to(coffee_item)
      end
    end

    describe "with invalid params" do
      it "assigns the coffee_item as @coffee_item" do
        coffee_item = CoffeeItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CoffeeItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => coffee_item.to_param, :coffee_item => {  }}, valid_session
        assigns(:coffee_item).should eq(coffee_item)
      end

      it "re-renders the 'edit' template" do
        coffee_item = CoffeeItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CoffeeItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => coffee_item.to_param, :coffee_item => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested coffee_item" do
      coffee_item = CoffeeItem.create! valid_attributes
      expect {
        delete :destroy, {:id => coffee_item.to_param}, valid_session
      }.to change(CoffeeItem, :count).by(-1)
    end

    it "redirects to the coffee_items list" do
      coffee_item = CoffeeItem.create! valid_attributes
      delete :destroy, {:id => coffee_item.to_param}, valid_session
      response.should redirect_to(coffee_items_url)
    end
  end

end
