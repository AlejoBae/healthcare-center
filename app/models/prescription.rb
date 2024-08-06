class Prescription < ApplicationRecord
  belongs_to :appointment

  validates :prescript, presence: true, length: { in: 1..650 }
end
