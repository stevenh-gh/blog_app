class Article < ApplicationRecord
  has_many :comments
  validates :title, presence: true # declares title must be present
  validates :body, presence: true, length: { minimum: 10 } # declares body to be present, a min length of 10 chars
end
