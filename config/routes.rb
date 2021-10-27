Rails.application.routes.draw do
  get("/", { :controller => "math", :action => "add_form" })
  
  get("/wizard_add", { :controller => "math", :action => "add_results" })
  
  get("/add", { :controller => "math", :action => "add_form" })


  get("/street_to_coords/results", { :controller => "umbrella", :action => "geocode_results" })
  
  get("/street_to_coords/new", { :controller => "umbrella", :action => "geocode_form" })
end
