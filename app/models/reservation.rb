class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house

  validates :start_date, :message, presence: true

  # 日帰り滞在時間、お泊まり日数、どちらか片方だけ入力必須にする 両方はダメ
  validates :either_stay_or_one_day, presence: { message: ' / Only one of them' }

  private
  def either_stay_or_one_day
    stay_days.present? ^ one_day_hours.present?
  end
end
