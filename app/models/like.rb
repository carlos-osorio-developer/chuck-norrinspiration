class Like < ApplicationRecord
  belongs_to :user
  belongs_to :joke

  validates :user_id, uniqueness: { scope: :joke_id, message: 'You can only add a joke as a favorite once' }
end
