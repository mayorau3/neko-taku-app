class House < ApplicationRecord
  belongs_to :user
  has_many :reservations
  belongs_to_active_hash :cat_history

  validates :pr, :explanation, presence: true
  # 「猫歴」に関するバリデーション 選択が「---」の時は保存できない
  validates :cat_history_id, numericality: { other_than: 1, message: 'Select' }
end
