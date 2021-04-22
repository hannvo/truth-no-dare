class Board < ApplicationRecord
  extend FriendlyId
  friendly_id :path, use: :slugged

  has_many :questions
  has_many :answers, through: :questions

  validates :title, presence: true, length: { maximum: 40 }
  validates :path, presence: true, uniqueness: true

  def open_questions(num = nil)
    open_qs = questions.select { |question| question.answers.count.zero? }
    num.nil? ? open_qs : open_qs.first(num)
  end
end
