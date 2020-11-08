class ReservationsController < ApplicationController
  before_action :set_house
  before_action :set_cat
  before_action :authenticate_user!


  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :stay_days, :one_day_hours, :message).merge(user_id: current_user.id, house_id: params[:house_id])
  end

  def set_house
    @house = House.find(params[:house_id])
    if current_user.id == @house.user_id
      redirect_to root_path
    end
  end

  def set_cat
    if Cat.find_by(user_id: current_user.id)
      @cat = Cat.find_by(user_id: current_user.id)
    else
      redirect_to new_cat_path
    end
  end
end
