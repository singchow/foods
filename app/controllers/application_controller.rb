class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_user
  skip_before_action :authenticate_user!, only: [:index, :chosen, :create]

  private
  def check_user
    puts "START ----- CHECKING USER"
    if(session.has_key?("current_user_email"))
      @user = User.find_by(email: session[:current_user_email])
    end
    puts "START ----- CHECKING USER"
  end
end
