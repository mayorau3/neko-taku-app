class House < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cat_history

  validates :pr, :explanation, :images, :cat_history_id, presence: true

  # 「猫歴」に関するバリデーション 選択が「---」の時は保存できない
  validates :cat_history_id, numericality: { other_than: 1, message: 'Select' }

  # 価格 日帰り、お泊まり、どちらか片方入力必須にする
  validates :stay_or_one_day, presence: true

  private
    def stay_or_one_day
      stay_price.presence or one_day_price.presence
    end

end
