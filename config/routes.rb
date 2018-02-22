Rails.application.routes.draw do
  devise_for :users
  root 'statics#home'
  get 'op', to: 'statics#test'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/communaute", to: "statics#communaute"
  get "/inscription", to: "statics#inscription"
  get "/peer", to: "statics#peer"
  get "/programme",  to: "statics#programme"
  post "/subscribe", to: "statics#subscribe"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
