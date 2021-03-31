class Question < ApplicationRecord
  belongs_to :board
  has_many :answers
end
