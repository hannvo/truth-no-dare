Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#new'
  resources :boards, only: [:create, :show] do
    resources :questions, only: [:create]
  end

  get 'questions/:question_id/answers/new', to: 'answers#new', as: 'new_question_answer'
  post 'questions/:question_id/answers', to: 'answers#create', as: 'question_answers'
  # get '/boards/:id', to: 'boards#show', as: 'board'
end
