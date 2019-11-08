Rails.application.routes.draw do
  devise_for :usuarios
  resources :atividades
  get 'welcome/index'
  resources :projetos do
    resources :trabalhos
  end
  resources :usuarios

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
