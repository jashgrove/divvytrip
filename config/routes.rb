Rails.application.routes.draw do
  resources :trips, only: %i[index show create update destroy]
end
