class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
