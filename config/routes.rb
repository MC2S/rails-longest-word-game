Rails.application.routes.draw do
  get 'game', to: 'all_game#game'
  get 'score', to: 'all_game#score'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
