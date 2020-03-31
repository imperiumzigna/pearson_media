json.extract! story, :id, :headline, :body, :deleted_at, :created_at, :updated_at
json.url story_url(story, format: :json)
