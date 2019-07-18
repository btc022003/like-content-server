Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles do
        resources :article_comments, only: [:index, :create, :destroy]
        resources :article_likes, only: [:create, :destroy]
        resources :article_collections, only: [:create, :destroy]
      end
      resources :auth, only: [] do
        collection do
          post :reg
          post :login
        end
      end
    end
  end
end
