class House < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cat_history

  validates :pr, :explanation, :images, presence: true

  # 「猫歴」に関するバリデーション 選択が「---」の時は保存できない
  validates :cat_history_id, numericality: { other_than: 1, message: 'Select' }

  # 価格 日帰り、お泊まり、どちらか片方入力必須にする
  validates :stay_or_one_day, presence: true
  # 価格 半角数字のみ可
  validates :one_day_price, format: { with: /\A.[0-9]+\z/, message: 'Half-width number' }, unless: ->{ one_day_price.blank?}
  validates :stay_price, format: { with: /\A.[0-9]+\z/, message: 'Half-width number' }, unless: ->{ stay_price.blank?}

  private
    def stay_or_one_day
      stay_price.presence or one_day_price.presence
    end

end
