Rails.application.routes.draw do
  get 'welcome/index'
  resources :projetos do
    resources :trabalhos
    resources :bibliografia
  end
  resources :usuarios

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
