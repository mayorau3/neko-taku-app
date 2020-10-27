class House < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cat_history

  validates :pr, :explanation, presence: true

  # 価格の範囲指定 ¥300〜¥9,999,999の間、半角数字のみ可
  validates :one_day_price, :stay_price, presence: true, format: { with: /\A.[0-9]+\z/, message: 'Half-width number' }

  # stay_priceが空ならば、one_day_priceを必須にする
  validates :one_day_price, presence: true, unless: :stay_price?

  # one_day_priceが空ならば、stay_priceを必須にする
  validates :stay_price, presence: true, unless: :one_day_price?

  # 「猫歴」に関するバリデーション 選択が「---」の時は保存できない
  validates :cat_history_id, numericality: { other_than: 1, message: 'Select' }
end
