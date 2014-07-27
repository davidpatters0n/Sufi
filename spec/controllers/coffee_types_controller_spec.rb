require 'spec_helper'
 
describe CoffeeTypesController do
 
  let(:valid_attributes) { {
      name: 'ESPRESSO RISTRETTO', type_of_coffee: 'intense', temp: '13', image: 'test',
      caffeinated: true, basicInfo: 'Some beautiful lorem ipsum text', price: '£2.98'
  } }
 
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CoffeeTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }
 
  context "HTML" do
 
    describe "GET index" do
      it "assigns all coffee_types as @coffee_types" do
        coffee_type = CoffeeType.create! valid_attributes
        get :index, {}, valid_session
        assigns(:coffee_types).should eq([coffee_type])
      end
    end
 
    describe "GET index with search params" do
      before :each do
        # create two coffee_types that should be found by searching for "Ame" and
        # one that shouldn't
        2.times { FactoryGirl.create :coffee_type }
        FactoryGirl.create :coffee_type, name: "Espresso", type_of_coffee: "Intense"
      end  

      it 'renders a list of Coffee Types' do
        get :index, {search: "Moc"}, valid_session
        assigns(:coffee_types).count.should eq(2)
      end


    it 'renders a list of Coffee Types based on search and filter' do
      get :index, {search: "Esp", filter: "Intense"}, valid_session
      assigns(:coffee_types).count.should eq(1)
    end
  end

    describe "GET show" do
      it "assigns the requested coffee_type as @coffee_type" do
        coffee_type = CoffeeType.create! valid_attributes
        get :show, {:id => coffee_type.to_param}, valid_session
        assigns(:coffee_type).should eq(coffee_type)
      end
    end
 
    describe "GET new" do
      it "assigns a new coffee_type as @coffee_type" do
        get :new, {}, valid_session
        assigns(:coffee_type).should be_a_new(CoffeeType)
      end
    end
 
    describe "GET edit" do
      it "assigns the requested coffee_type as @coffee_type" do
        coffee_type = CoffeeType.create! valid_attributes
        get :edit, {:id => coffee_type.to_param}, valid_session
        assigns(:coffee_type).should eq(coffee_type)
      end
    end
 
    describe "POST create" do
      describe "with valid params" do
        it "creates a new CoffeeType" do
          expect {
            post :create, {:coffee_type => valid_attributes}, valid_session
          }.to change(CoffeeType, :count).by(1)
        end
 
        it "assigns a newly created coffee_type as @coffee_type" do
          post :create, {:coffee_type => valid_attributes}, valid_session
          assigns(:coffee_type).should be_a(CoffeeType)
          assigns(:coffee_type).should be_persisted
        end
 
        it "redirects to the created coffee_type" do
          post :create, {:coffee_type => valid_attributes}, valid_session
          response.should redirect_to(coffees_path(CoffeeType.last))
        end
      end
 
      describe "with invalid params" do
        it "assigns a newly created but unsaved coffee_type as @coffee_type" do
          # Trigger the behavior that occurs when invalid params are submitted
          CoffeeType.any_instance.stub(:save).and_return(false)
          post :create, {:coffee_type => {"name" => "invalid value"}}, valid_session
          assigns(:coffee_type).should be_a_new(CoffeeType)
        end
 
        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          CoffeeType.any_instance.stub(:save).and_return(false)
          post :create, {:coffee_type => {"name" => "invalid value"}}, valid_session
          response.should render_template("new")
        end
      end
    end
 
    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested coffee_type" do
          coffee_type = CoffeeType.create! valid_attributes
          # Assuming there are no other coffee_types in the database, this
          # specifies that the CoffeeType created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          CoffeeType.any_instance.should_receive(:update).with({"name" => "MyString"})
          put :update, {:id => coffee_type.to_param, :coffee_type => {"name" => "MyString"}}, valid_session
        end
 
        it "assigns the requested coffee_type as @coffee_type" do
          coffee_type = CoffeeType.create! valid_attributes
          put :update, {:id => coffee_type.to_param, :coffee_type => valid_attributes}, valid_session
          assigns(:coffee_type).should eq(coffee_type)
        end
 
        it "redirects to the coffee_type" do
          coffee_type = CoffeeType.create! valid_attributes
          put :update, {:id => coffee_type.to_param, :coffee_type => valid_attributes}, valid_session
          response.should redirect_to(coffees_path(coffee_type))
        end
      end
 
      describe "with invalid params" do
        it "assigns the coffee_type as @coffee_type" do
          coffee_type = CoffeeType.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          CoffeeType.any_instance.stub(:save).and_return(false)
          put :update, {:id => coffee_type.to_param, :coffee_type => {"name" => "invalid value"}}, valid_session
          assigns(:coffee_type).should eq(coffee_type)
        end
 
        it "re-renders the 'edit' template" do
          coffee_type = CoffeeType.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          CoffeeType.any_instance.stub(:save).and_return(false)
          put :update, {:id => coffee_type.to_param, :coffee_type => {"name" => "invalid value"}}, valid_session
          response.should render_template("edit")
        end
      end
    end
 
    describe "DELETE destroy" do
      it "destroys the requested coffee_type" do
        coffee_type = CoffeeType.create! valid_attributes
        expect {
          delete :destroy, {:id => coffee_type.to_param}, valid_session
        }.to change(CoffeeType, :count).by(-1)
      end
 
      it "redirects to the coffee_types list" do
        coffee_type = CoffeeType.create! valid_attributes
        delete :destroy, {:id => coffee_type.to_param}, valid_session
        response.should redirect_to(coffees_url)
      end
    end
  end
 
  context "JSON" do
    describe "creating a new coffee" do
      context "when authorized" do
        it "should create a new coffee type " do
          json = {:format => 'json',
                  :coffee_type => {:name => 'ESPRESSO RISTRETTO', :type_of_coffee => 'intense',
                                   :temp => '13', image: 'test', :caffeinated => true,
                                   :info => 'Some beautiful lorem ipsum text', :price => '£2.98'}}
          post :create, json
          CoffeeType.count.should == 1
          response.status.should eq(201)
        end
      end
      context "when authorized" do
        it "assigns all coffee_types as @coffee_types" do
          coffee_type = CoffeeType.create! valid_attributes
          get :index, :format => :json
          assigns(:coffee_types).should eq([coffee_type])
        end
      end
    end
 
    describe "GET show" do
      context "when authorised" do
        it "GET show" do
          coffee_type = CoffeeType.create! valid_attributes
          get :show, {:id => coffee_type.to_param}, :format => :json
          response.body.should  == coffee_type.to_json
        end
      end
    end
    describe "GET index" do
      context "when no params provided" do
        it "GET index without params or total count" do
          coffee_type = CoffeeType.create! valid_attributes
          get :index, :format => :json
          assigns(:coffee_types).should eq([coffee_type])
        end
      end
      context "with params" do
        it "GET index with params and total count" do
          CoffeeType.create! valid_attributes
          get :index,{filter:"latte"}, :format => :json
          parsed_body = JSON.parse(response.body)
          parsed_body.should have_key("total_coffees")
        end
        it "GET index id included in the response" do
          CoffeeType.create! valid_attributes
          get :index,:format => :json
          parsed_body = JSON.parse(response.body)
          parsed_body["cofee_types"].first.should have_key("id")
        end
      end
    end

  end
end