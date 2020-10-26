class House < ApplicationRecord
  belongs_to :user
  has_many :reservations
  belongs_to_active_hash :cat_history
end
