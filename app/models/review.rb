class Review < ApplicationRecord
  belongs_to :liquor_store
  belongs_to :user

  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { greater_than: 0, less_than: 6 }
end
