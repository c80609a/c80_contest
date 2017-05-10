C80Contest::Engine.routes.draw do
  # match '/message_order', :to => 'mess#handle_message_order', :via => :post
  match '/give_me_bid_form', :to => 'site#give_me_form', :via => :post
  # get 'index', :to => 'site#index'
end
