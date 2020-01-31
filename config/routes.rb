Rails.application.routes.draw do
  resources :locations do
    resources :parks
  end
end
