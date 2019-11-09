class Dividend < ApplicationRecord
  validates :money , presence: true
  belongs_to :bland
end
