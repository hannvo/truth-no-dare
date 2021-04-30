class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :questions
  has_many :answers, through: :questions

  validates :title, presence: true, length: { maximum: 40 }

  def open_questions(num)
    questions.left_outer_joins(:answers).where("answers.question_id is null").limit(num).to_a
  end
end
