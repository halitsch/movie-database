class AnalyticsController < ApplicationController

  #returns pair of movie and average rating for that movie
  def best_rated
    if params[:genre].blank?
      @movies = Movie.joins(:rating).
                select('movie.movie_id, movie.title, count(movie.movie_id) as count, avg(rating.ratingValue) as average').
                group("movie.movie_id")
    else
      @movies = Movie.joins(:genre).
                where('genre.name = ?', params[:genre]).joins(:rating).
                select('movie.movie_id, movie.title, count(movie.movie_id) as count, avg(rating.ratingValue) as average').
                group("movie.movie_id")
    end
    
    get_genre_list
  end

  def genre_loans
    @movies_count_and_genre = Hash.new

    @movies = Movie.joins(:loan).
              select('movie.movie_id, movie.title, count(movie.movie_id) as count').
              group("movie.movie_id")
    
    @movies.each do |mov|
        @movies_count_and_genre[mov.title] = {count: mov.count, genres: mov.genre }
    end

#   unless params[:genre].blank?
#
#      if params[:genre].include? mov.genre
#      @movies_count_and_genre[mov.title] = {count: mov.count, genres: mov.genre }
#      end

#      @movies_count_and_genre.keep_if { |k,v| v[:genres].name.include?(params[:genre]) }
#      @movies_count_and_genre = @movies_count_and_genre.keep_if { |k,v| params[:genre].include?(v[:genres].name) }
#    end

    get_genre_list
  end

  def charts
    group = Wishlist.all.group_by { |m| m.wis_date.beginning_of_month }
    group = group.each { |date, wish| [date, wish.length] }

    @month_and_wishes = Array.new
    group.each do |date, wishlists|
     @month_and_wishes << [date.strftime('%B %Y'), wishlists.length]
    end
  end

  def most_commented
    @movies = Movie.joins(:comment).
              select('movie.movie_id, movie.title, count(movie.movie_id) as count').
              group('movie.movie_id').
              order('count DESC').take(10)
    end

  def most_active
    @users_comments = User.joins(:comment).
                      select('user.user_id, user.user_name, user.first_name, user.last_name, count(user.user_id) as count').
                      group('user.user_id').
                      order('count DESC').take(10)

    @users_ratings = User.joins(:rating).
                      select('user.user_id, user.user_name, user.first_name, user.last_name, count(user.user_id) as count').
                      group('user.user_id').
                      order('count DESC').take(10)
  end

  # Returns pair of genre name and count of movies of that genre
  # It's in pure SQL and not active record approach because I had this query writen before. 
  def movies_genres_count
    @genres = Movie.find_by_sql('select g.name, count(*) as count from genre g left join classification c on g.genre_id = c.genre_id left join movie m on c.movie_id = m.movie_id group by g.name')
  end
private
  
  def get_genre_list
    @genre_names = Genre.select('name')
  end

end