class MainsController < ApplicationController

  def index
    puts "Start -- Getting Image"
    @image = Image.all.sample(2)
    puts "End -- Getting Image"

    puts "START --------- COLLECTING USER INFO"
    puts request.ip
    puts request.location.longitude.to_s + " , " + request.location.latitude.to_s
    puts request.location.country
    puts request.env["HTTP_REFERER"]
    Geotrack.create(ip: request.ip,
                    coordinate: request.location.longitude.to_s + "," + request.location.latitude.to_s,
                    county: request.location.country,
                    referral: request.env["HTTP_REFERER"])
    puts "END ----------- COLLECTING USER INFO"
  end

  def create
    puts "START --------- GETTING USER EMAIL"
    puts params[:email]
    User.create(email: params[:email], password: Devise.friendly_token.first(8))
    puts "END ----------- GETTING USER EMAIL"
    session[:current_user_email] = params[:email]
    redirect_to "/"
  end

end
