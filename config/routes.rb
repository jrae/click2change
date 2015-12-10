Click2Change::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  scope '/api' do
    resources :change_actions, only: [:show, :index]
    resources :organisations, only: [:show, :index]
  end

end
