class Review < ApplicationRecord
  belongs_to :liquor_store
  belongs_to :user
end
