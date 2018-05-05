Rails.application.routes.draw do
  root 'home#index'
  get 'about' => 'home#about' 

  # 記事管理機能
  resources :articles

  # ユーザ登録
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # ログイン・ログアウト
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # カテゴリ機能
  resources :categories, except: [:destroy]

end
