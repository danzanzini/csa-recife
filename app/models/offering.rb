class Offering < ApplicationRecord
  belongs_to :location
  has_many :offers, dependent: :destroy
end
