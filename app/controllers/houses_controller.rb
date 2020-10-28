class HousesController < ApplicationController
  def index
    @houses = House.all.order('created_at DESC')
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
    params.require(:house).permit(:pr, :explanation, :cat_history_id, :chara_stay, :chara_5min, :chara_house, :chara_floor, :chara_weekend, :chara_weekday, :chara_have_cat, :chara_tower, :chara_camera, :stay_price, :one_day_price, images: []).merge(user_id: current_user.id)
  end
end
