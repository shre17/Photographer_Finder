json.extract! article, :id, :title, :description, :banner_image, :photographers_id, :created_at, :updated_at
json.url article_url(article, format: :json)
