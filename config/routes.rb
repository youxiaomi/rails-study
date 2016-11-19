Rails.application.routes.draw do

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end

  resources :groups do
    resources :images do

    end
  end



end
