json.extract! comment, :id, :text, :users_id, :posts_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
