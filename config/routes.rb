Rails.application.routes.draw do
  
  devise_for :users
  root "places#index"
  
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  # Routes for the Like resource:

  # CREATE
  get("/likes/new", { :controller => "likes", :action => "new_form" })
  post("/create_like", { :controller => "likes", :action => "create_row" })

  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  get("/likes/:id_to_display", { :controller => "likes", :action => "show" })

  # UPDATE
  get("/likes/:prefill_with_id/edit", { :controller => "likes", :action => "edit_form" })
  post("/update_like/:id_to_modify", { :controller => "likes", :action => "update_row" })

  # DELETE
  get("/delete_like/:id_to_remove", { :controller => "likes", :action => "destroy_row" })

  #------------------------------

  # Routes for the Follow request resource:

  # CREATE
  get("/follow_requests/new", { :controller => "follow_requests", :action => "new_form" })
  post("/create_follow_request", { :controller => "follow_requests", :action => "create_row" })

  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  get("/follow_requests/:id_to_display", { :controller => "follow_requests", :action => "show" })

  # UPDATE
  get("/follow_requests/:prefill_with_id/edit", { :controller => "follow_requests", :action => "edit_form" })
  post("/update_follow_request/:id_to_modify", { :controller => "follow_requests", :action => "update_row" })

  # DELETE
  get("/delete_follow_request/:id_to_remove", { :controller => "follow_requests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Place resource:

  # CREATE
  get("/places/search", { :controller => "places", :action => "search_form" })
  get("/places/results", { :controller => "places", :action => "search_results" })
  post("/create_place", { :controller => "places", :action => "create_row" })

  # READ
  get("/places", { :controller => "places", :action => "index" })
  get("/places/:id_to_display", { :controller => "places", :action => "show" })

  # UPDATE
  get("/places/:prefill_with_id/edit", { :controller => "places", :action => "edit_form" })
  post("/update_place/:id_to_modify", { :controller => "places", :action => "update_row" })

  # DELETE
  get("/delete_place/:id_to_remove", { :controller => "places", :action => "destroy_row" })

  #------------------------------


  # Routes for the Users resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })


  #------------------------------

  get("/my_likes", {:controller => "likes", :action => "my_likes"})
  get "/feed", :controller => "places", :action => "feed"


end
