class TypeName < ApplicationRecord
  has_many :blands
  has_many :users, through: :blands
end
