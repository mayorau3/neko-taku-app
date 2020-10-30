class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update]
  before_action :search_house, only: [:index, :search]

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

  def show
  end

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to house_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    house = House.find(params[:id])
    house.destroy
  end

  def search
    @results = @p.result
  end

  private

  def house_params
    params.require(:house).permit(:pr, :explanation, :cat_history_id, :chara_stay, :chara_5min, :chara_house, :chara_floor, :chara_weekend, :chara_weekday, :chara_have_cat, :chara_tower, :chara_camera, :stay_price, :one_day_price, images: []).merge(user_id: current_user.id)
  end

  def set_house
    @house = House.find(params[:id])
  end

  def search_house
    @p = House.ransack(params[:q])
  end
end
