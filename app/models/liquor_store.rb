class LiquorStore < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :neighborhood

  def average_rating
    ratings_sum = 0
    revs = self.reviews
    ratings_array = revs.map {|r| r.rating}

    ratings_array.each do |r|
      ratings_sum += r
    end
    ratings_sum / ratings_array.length
  end

end
