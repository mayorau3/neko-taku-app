class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @cat = Cat.find(current_user.id)
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
    params.require(:reservation).permit(:start_date, :stay_days, :one_day_hours, :message).merge(user_id: current_user.id, house_id: params[:house_id], cat_id: params[:cat_id])
  end
end
