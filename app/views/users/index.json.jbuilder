json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :user_name, :first_name, :last_name, :gender, :dob, :email, :phone, :address
  json.url user_url(user, format: :json)
end
