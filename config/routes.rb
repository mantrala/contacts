Rails.application.routes.draw do
  root 'contacts#index'

  resources :contacts, only: [:index] do
    collection do
      post 'upload'
    end
  end
end
