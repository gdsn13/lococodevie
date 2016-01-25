class UserSessionsController < ApplicationController

  #TODO : durée de validité pour session 
  #

  def create
    user_name = params[:user_session][:name]
    password = params[:user_session][:password]
    
    reset_of_session
    
    if user_name != "" && password != ""
       if user_name == "e" && password == "e"
          session[:user] = "etudiant"
          redirect_to params[:user_session][:url]
       end
      
    else
      flash[:errors] = I18n.t('login.both_field_required') 
      redirect_to new_user_session_path
    end
  end
  
  # logout
  def destroy
    reset_of_session
    redirect_to "/"
  end
    
  def reset_of_session
    session[:user] = ""
  end  
end
