PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resource :posts, except: [:destroy] do
    resource :comments, only: [:create, :show]
  end
end
