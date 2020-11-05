class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house
  belongs_to :cat

  validates :start_date, :message, presence: true

  # 価格 日帰り、お泊まり、どちらか片方入力必須にする
  validates :stay_or_one_day, presence: true

  private
  def stay_or_one_day
    stay_days.presence or one_day_hours.presence
  end
end
