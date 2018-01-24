class Review < ApplicationRecord
  belongs_to :liquor_store
  belongs_to :user

  validates :rating, length: {in: 1..5}
end
