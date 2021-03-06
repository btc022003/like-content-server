Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :articles do
        resources :article_collections, only: [:create, :destroy]
        resources :article_comments, only: [:index, :create, :destroy]
        resources :article_likes, only: [:create, :destroy]
      end
      resources :auth, only: [] do
        collection do
          post :login
          post :reg
        end
      end
      resources :common, only: [] do
        collection do
          post :upload_files
        end
      end
      resources :users, only: [] do
        collection do
          get :info
          post :modify_info
          post :modify_pwd
        end
      end
    end
  end
end
