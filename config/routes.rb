Rails.application.routes.draw do

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
  get("/add_bookmark", { :controller => "vendors", :action => "add_use_bookmark" })
          
  # READ
  get("/bookmarks/:user_id", { :controller => "bookmarks", :action => "index" })

  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Vendor resource:

  # CREATE
  post("/insert_vendor", { :controller => "vendors", :action => "create" })
          
  # READ
  get("/add_vendor", { :controller => "vendors", :action => "add" })
  get("/vendors", { :controller => "vendors", :action => "index" })
  
  get("/vendors/:path_id", { :controller => "vendors", :action => "show" })
  
  # UPDATE
  
  post("/modify_vendor/:path_id", { :controller => "vendors", :action => "update" })
  
  # DELETE
  get("/delete_vendor/:path_id", { :controller => "vendors", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

get("/", { :controller => "application", :action => "home" })

end
