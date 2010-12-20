Testapplication::Application.routes.draw do
	get "home/index"  

	root :to => "contacts#index"
	
	match '/contacts/search' => 'contacts#search'
	resources :contacts
	
	
  
	
end
