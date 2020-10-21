class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :house
  belongs_to :cat
end
