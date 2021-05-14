class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions, dependent: :destroy

  before_validation :set_default_theme

  validates :title, presence: true, length: { maximum: 40 }
  validates :theme, presence: true, inclusion: { in: ['fun'] }

  def open_questions(num)
    questions.left_outer_joins(:answers).where("answers.question_id is null").limit(num).to_a
  end

  private

  def set_default_theme
    self.theme = 'fun' if theme.nil?
  end
end
