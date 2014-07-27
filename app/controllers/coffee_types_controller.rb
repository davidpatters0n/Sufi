class CoffeeTypesController < ApplicationController
 
 
  before_action :set_coffee_type, only: [:show, :edit, :update, :destroy]
  respond_to :json 
 
  def index
    @coffee_types = CoffeeType.filter(params[:filter]).search(params[:search]).limit(params[:per_page] || 5).offset(params[:offset] || 0)
    @total_results = CoffeeType.filter(params[:filter]).search(params[:search]).count
    render json: {coffee_types: @coffee_types.as_json(root:false), total_coffees:@total_results.as_json}.as_json
  end

  def show
    @coffee_types = CoffeeType.find(params[:id])
      render json: @coffee_types.to_json, root: false
  end
 
  def new
    @coffee_type = CoffeeType.new
  end
 
  def edit
  end
 
  def create
    @coffee_type = CoffeeType.new(coffee_type_params)
 
    respond_to do |format|
      if @coffee_type.save
        format.html { redirect_to coffees_path(@coffee_type), notice: 'Coffee type was successfully created.' }
        format.json { render action: 'show', status: :created, location: coffees_path(@coffee_type) }
      else
        format.html { render action: 'new' }
        format.json { render json: @coffee_type.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def update
    respond_to do |format|
      if @coffee_type.update(coffee_type_params)
        format.html { redirect_to coffees_path(@coffee_type), notice: 'Coffee type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coffee_type.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @coffee_type.destroy
    respond_to do |format|
      format.html { redirect_to coffees_url }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_type
      @coffee_type = CoffeeType.find(params[:id])
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_type_params
      params.require(:coffee_type).permit(:name, :image, :type_of_coffee, :temp, :caffeinated, :basicInfo, :price, :fullInfo, :drinks)
    end
end