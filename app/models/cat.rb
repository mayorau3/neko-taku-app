class Cat < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :age

  validates :name, :age_id, :sex, :explanation, :images, presence: true

  # 「年齢」に関するバリデーション 選択が「---」の時は保存できない
  validates :age_id, numericality: { other_than: 1, message: 'Select' }
end
