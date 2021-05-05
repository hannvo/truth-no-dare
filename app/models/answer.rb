class Answer < ApplicationRecord
  belongs_to :question
  validates :text, presence: true, length: { maximum: 400 }
end
