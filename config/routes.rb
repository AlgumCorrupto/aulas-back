Rails.application.routes.draw do
  namespace :api do
    namespace :user do
      resources :disciplina, only: [:index, :show]
      resources :aulas, only: [:index, :show]
      resources :entrar, only: [:index, :create]
    end
    namespace :admin do
      resources :aluno
      resources :disciplina
      resources :aula
      resources :entrar, only: [:index, :create]
      resources :permissao, only: [:create]
    end
  end
end
