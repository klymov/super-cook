class HomeController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]

  def index
    if current_user.present?
      @name = current_user.email
    else
      @name = 'unregistered user'
    end
  end


end