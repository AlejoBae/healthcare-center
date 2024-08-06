class Category < ApplicationRecord
  has_many :doctor, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
