json.extract! user, :id, :email, :crypted_password, :salt, :rails, :g, :scaffold, :created_at, :updated_at
json.url user_url(user, format: :json)
