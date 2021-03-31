class Board < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 }
  validates :path, presence: true, uniqueness: true
end
