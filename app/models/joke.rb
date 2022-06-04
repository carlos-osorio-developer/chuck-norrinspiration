class Joke < ApplicationRecord
  validates :api_id, presence: true, uniqueness: true
  validates :content, presence: true
end
