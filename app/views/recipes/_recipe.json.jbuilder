json.extract! recipe, :id, :name, :description, :categorie, :difficulty, :prep_time, :cooking_time, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
