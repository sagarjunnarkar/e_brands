Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { invitations: 'devise/invitations', sessions: 'users/sessions'}, path_names: { sign_in: :login }
    resource :user, only: [:show, :update]
    root 'users#show'
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
