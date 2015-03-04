class Front::DatasController < ApplicationController

  respond_to :json
  #caches_action :spectacle_list, :get_page, :get_dates, :get_intro, :get_spectacle

  def get_login
    user = params[:login_field]
    psswd = params[:psswd_field]

    if user == "presse" && psswd == "saisonlacriee"
      res = {
        :user_name => 'ok'
      }
    else
      res = {
        :user_name => 'unknown'
      }
    end

    render :json => res.to_json
  end
  
end
