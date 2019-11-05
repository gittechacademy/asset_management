class Bland < ApplicationRecord
  before_save { self.code.upcase!}
  validates :name, presence: true, length: { maximum: 50 }
  validates :code, presence: true, length: { in: 4..5 },
                    format:{with:/\A\d{4}|[a-zA-Z]{4,5}\Z/}
  belongs_to :user
  belongs_to :type_name
  has_many :stocks, dependent: :destroy
  has_many :dividends, dependent: :destroy
end
