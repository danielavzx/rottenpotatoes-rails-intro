#class Movie < ActiveRecord::Base
#end

class Movie < ActiveRecord::Base
  def self.all_ratings
    ['G', 'PG', 'PG-13', 'R']
  end

  def self.with_ratings(ratings_list, sort_by = nil)
    if ratings_list.blank?
      movies = Movie.all
    else
      movies = Movie.where('LOWER(rating) IN (?)', ratings_list.map(&:downcase))
    end

    if sort_by.present?
      movies = movies.order(sort_by)
    end

    movies

  end
end
