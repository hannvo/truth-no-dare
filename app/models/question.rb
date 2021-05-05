class Question < ApplicationRecord
  belongs_to :board
  has_many :answers, dependent: :destroy
  validates :text, presence: true, length: { maximum: 400 }
end
