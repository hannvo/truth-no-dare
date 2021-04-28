class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :path, use: :slugged

  has_many :questions
  has_many :answers, through: :questions

  validates :title, presence: true, length: { maximum: 40 }
  validates :path, presence: true, uniqueness: true

  def open_questions(num)
    questions.left_outer_joins(:answers).where("answers.question_id is null").limit(num)
  end
end
