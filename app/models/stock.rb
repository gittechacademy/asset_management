class Stock < ApplicationRecord
  validates :number, presence: true
  validates :money , presence: true
  belongs_to :bland
end
