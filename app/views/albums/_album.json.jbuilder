json.extract! album, :id, :name, :description, :photographers_id, :created_at, :updated_at
json.url album_url(album, format: :json)
