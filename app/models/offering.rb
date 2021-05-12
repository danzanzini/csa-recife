class Offering < ApplicationRecord
  has_many :offers, dependent: :destroy
end
