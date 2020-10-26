class House < ApplicationRecord
  belongs_to :user
  has_many :reservations

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cat_history

  validates :pr, :explanation, presence: true

  # stay_priceが空ならば、one_day_priceを必須にする
  validates :one_day_price, presence: true, unless: :stay_price?

  # one_day_priceが空ならば、stay_priceを必須にする
  validates :stay_price, presence: true, unless: :one_day_price?

  # 「猫歴」に関するバリデーション 選択が「---」の時は保存できない
  validates :cat_history_id, numericality: { other_than: 1, message: 'Select' }
end
