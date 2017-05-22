C80Contest::Engine.routes.draw do
  match '/give_me_bid_form', :to => 'site#give_me_form', :via => :post, :defaults => { :format => 'js' }
  match '/make_bid', :to => 'bid#make_bid', :via => :post, :defaults => { :format => 'js' }
  match '/rules_page', :to => 'pages#rules_page', :via => :get

  get '/uploads/bids/:file_name.:ext', :to => 'bid_photos#image'

end
