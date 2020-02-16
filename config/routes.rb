Rails.application.routes.draw do

  resources :recipes do
    resources :recipe_ingredients, only: [:new, :create, :destroy]
  end
  resources :ingredients

end
