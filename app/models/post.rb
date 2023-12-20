class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :genre, presence: true
  validates :start_time, presence: true
  validates :location, presence: true
  validates :body, presence: true
end
