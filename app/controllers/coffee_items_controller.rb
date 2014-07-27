class CoffeeItemsController < ApplicationController
  before_action :set_coffee_item, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @coffee_items = CoffeeItem.all
  end

  def show
  end

  def new
    @coffee_item = CoffeeItem.new
  end

  def edit
  end

  def create
    @coffee_item = CoffeeItem.new(coffee_item_params)

    respond_to do |format|
      if @coffee_item.save
        format.json { render action: 'show', status: :created, location: @coffee_item }
      else
        format.json { render json: @coffee_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coffee_item.update(coffee_item_params)
        format.json { head :no_content }
      else
        format.json { render json: @coffee_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coffee_item.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_item
      @coffee_item = CoffeeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_item_params
      params.require(:coffee_item).permit(:user_id, :coffee_order_id)
    end
end
