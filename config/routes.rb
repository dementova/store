Rails.application.routes.draw do
  root 'wellcome#index'

  resources :products do
  	collection { get :list }
  end
  resources :baskets do
  	collection { get :list, :add, :destroy }
  end
end
