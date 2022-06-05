class Joke < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  validates :api_id, presence: true, uniqueness: true
  validates :content, presence: true
end
