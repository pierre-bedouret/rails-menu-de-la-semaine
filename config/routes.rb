Rails.application.routes.draw do

  resources :recipes do
    resources :ingredients, only: %i[show new create]
  end
  resources :ingredients, only: %i[index edit update destroy]
end
