Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
       # 瀏覽所有餐廳的最新動態
       # GET restaurants/feeds
       get :feeds
       get :ranking
     end

     member do
       # 瀏覽個別餐廳的 Dashboard
       # GET restaurants/:id/dashboard
       get :dashboard

       post :favorite
       post :unfavorite
       post :like
       post :unlike
     end
  end
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update]
  root "restaurants#index"

  namespace :admin do
    resources :restaurants
    resources :categories   # 請加入此行
    root "restaurants#index"
  end
end
