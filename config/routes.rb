Rails.application.routes.draw do
  root to: "locations#index"
  resources :locations do
    resources :parks
  end
end
