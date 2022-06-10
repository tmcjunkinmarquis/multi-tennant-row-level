json.extract! author, :id, :slug, :first_name, :last_name, :bio_info, :created_at, :updated_at
json.url author_url(author, format: :json)
