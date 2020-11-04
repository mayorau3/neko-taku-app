class CatsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :age_id, :sex, :chara_clever, :chara_sleep, :chara_active, :chara_quiet, :chara_greedy, :chara_lonely, :chara_own, :explanation,  images: []).merge(user_id: current_user.id)
  end

end
