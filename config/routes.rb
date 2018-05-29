Rails.application.routes.draw do

  resources :shots do
  	resources :comments,except: [:new,:edit,:index,:show,:update]
  	member do
  		put 'like' ,to: "shots#like"
  		put 'unlike' ,to: "shots#unlike"
  	end
  end


  devise_for :users , controllers: {registrations: 'registrations'}
  root 'shots#index'

end
