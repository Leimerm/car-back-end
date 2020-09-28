Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :employees do
        post :login
        post :create
        get :me
        delete :logout
      end
      namespace :cars do
        get :index
        get :show
        post :create
        patch :update
        delete :destroy
      end
    end
  end
end