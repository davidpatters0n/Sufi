class CoffeeOrdersController < ApplicationController
  before_action :set_coffee_order, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def index
    @coffee_orders = CoffeeOrder.all
  end


  def show
  end

  def new
    @coffee_order = CoffeeOrder.new
  end

  def edit
  end

  def create
    @coffee_order = CoffeeOrder.new(coffee_order_params)

    respond_to do |format|
      if @coffee_order.save
        format.json { render action: 'show', status: :created, location: @coffee_order }
      else
        format.json { render json: @coffee_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coffee_order.update(coffee_order_params)
        format.json { head :no_content }
      else
        format.json { render json: @coffee_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coffee_order.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_order
      @coffee_order = CoffeeOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coffee_order_params
      params.require(:coffee_item).permit(:user_id, :coffee_order_id)
    end
end
