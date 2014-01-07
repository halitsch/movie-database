class StaticController < ApplicationController
  def index
	@movies = Movie.joins(:rating).
			 select('movie.movie_id, movie.title, count(movie.movie_id) as count, avg(rating.ratingValue) as average').
			 group('movie.movie_id').
			 order('average DESC').
			 limit('10')

	@comments = Comment.order('comment.time DESC').limit(10)
  end
end
