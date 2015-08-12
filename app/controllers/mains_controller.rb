class MainsController < ApplicationController

  def index
    puts "Start -- Getting Image"

    if(session.has_key?("image_id"))
      puts "session exist"
      puts session[:image_id]
      @image = Image.where.not(id: session[:image_id]).sample(2)
      session[:image_id] += @image.map {|x| x.id}
      session[:played] = session[:played].to_f + 1
      puts "new session"
      puts session[:image_id]

    else
      puts "creating session"
      @image = Image.all.sample(2)
      session[:image_id] = @image.map {|x| x.id}
      session[:played] = 1
      puts session[:image_id]
    end
    puts "End -- Getting Image"

    puts "START --------- COLLECTING USER INFO"
    puts request.ip
    puts request.location.longitude.to_s + " , " + request.location.latitude.to_s
    puts request.location.country
    puts request.env["HTTP_REFERER"]
    Geotrack.create(ip: request.ip,
                    coordinate: request.location.latitude.to_s + "," + request.location.longitude.to_s,
                    county: request.location.country,
                    state: request.location.state,
                    referral: request.env["HTTP_REFERER"])
    puts "END ----------- COLLECTING USER INFO"
  end

  def yourlist
    puts "START --------- GETTING USER LIST"
    puts session[:email]
    @userlist = Image.where(id: session[:selected_images].split(","))
    puts "END ----------- GETTING USER LIST"
  end

  def create
    puts "START --------- GETTING USER EMAIL"
    puts params[:email]
    @user = User.find_by(email: params[:email])
    if(@user.blank?)
      User.create(email: params[:email], password: Devise.friendly_token.first(8))
      puts "END ----------- GETTING USER EMAIL"
      session[:current_user_email] = params[:email]
    else
      session[:current_user_email] = @user.email
    end
    puts "Played"
    puts session[:played]
  if(session.has_key?("played") && session[:played] > 15)
    redirect_to "/yourlist"
  else
    redirect_to "/"
  end
  end

end
