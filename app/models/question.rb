class Question < ApplicationRecord
  belongs_to :board
  has_many :answers
  validates :text, presence: true
end
