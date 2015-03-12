class Front::DatasController < ApplicationController

  respond_to :json
  #caches_action :spectacle_list, :get_page, :get_dates, :get_intro, :get_spectacle

  def get_login
    user = params[:login_field]
    psswd = params[:psswd_field]

    user_list = { "staff_oleamedical" => "oleamedical_ovtd2015", 
                  "distributors_oleamedical" => "distrib_olea2015", 
                  "customer_oleamedical" => "custom_olea2015", 
                  "documentation_oleamedical" => "info_olea2015"
                }

    if user_list[user] == psswd
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
