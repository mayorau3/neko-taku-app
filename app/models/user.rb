class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region

  validates :nickname, presence: true

  # パスワード半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

  # 名前漢字・平仮名・カタカナ
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :kanji_family_name
    validates :kanji_first_name
  end

  with_options presence: true do
    validates :city, :address1
    # 「住所」の郵便番号に関するバリデーション
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    # 「電話番号」に関するバリデーション
    validates :phone, length: { maximum: 11 }
  end
  # 「住所」の都道府県に関するバリデーション 選択が「---」の時は保存できない
  validates :region_id, numericality: { other_than: 1, message: 'Select' }

  has_one :house
  has_many :cats
  has_many :reservations
end
