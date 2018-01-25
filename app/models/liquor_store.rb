class LiquorStore < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :neighborhood

  def ratings_by_ls
    revs = self.reviews
    revs.map {|r| r.rating}
  end

  def sum_of_ratings
    ratings_sum = 0

    ratings_by_ls.each do |r|
      ratings_sum += r
    end
    ratings_sum
  end

  def average_rating
    if ratings_by_ls.length > 0
      sum_of_ratings / (ratings_by_ls.length)
    end
  end
end
