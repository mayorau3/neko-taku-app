class HousesController < ApplicationController
  def index
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def house_params
    params.require(:house).permit(:pr, :explanation, :cat_history_id, :stay_price, :one_day_price, :image, character: []).merge(user_id: current_user.id)
  end
end
