#class Movie < ActiveRecord::Base
#end

class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings_list)
    if ratings_list.blank?
      Movie.all
    else
      Movie.where('LOWER(rating) IN (?)', ratings_list.map(&:downcase))
    end
  end
end
