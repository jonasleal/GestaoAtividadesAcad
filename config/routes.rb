Rails.application.routes.draw do

  devise_for :usuarios, controllers: { sessions: 'usuarios/sessions' ,registrations:'usuarios/registrations'}

  get 'usuarios/sign_in'
  resources :projetos do
    resources :trabalhos
    resources :bibliografia
    resources :atividades do
      resources :historico_atividades
    end
  end
  resources :usuarios


  root 'usuarios#new'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end