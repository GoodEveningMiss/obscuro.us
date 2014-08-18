class Users::RegistrationsController < Devise::RegistrationsController 
  before_filter :require_no_authentication
  
end 