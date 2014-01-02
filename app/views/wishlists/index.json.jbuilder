json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :id, :wis_id, :wis_date, :user_id, :movie_id
  json.url wishlist_url(wishlist, format: :json)
end
