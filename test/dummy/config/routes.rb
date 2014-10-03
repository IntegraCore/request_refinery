Rails.application.routes.draw do

  mount RequestRefinery::Engine => "/request_refinery"
end
