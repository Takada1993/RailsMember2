Rails.application.routes.draw do
  get 'article/top'
  get 'article/list'
  post 'article/list'
  get 'article/input'
  post 'article/input'
  get 'article/show'
  post 'article/show'
  get 'article/create'
  post 'article/create'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations'
  }

  devise_scope :user do 
   post 'users/sign_up/confirm' => 'users/registrations#confirm'
   post 'users/sign_up/complete' => 'users/registrations#complete'
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
