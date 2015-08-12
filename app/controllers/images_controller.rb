class ImagesController < ApplicationController
  def chosen
    puts "START ---- CHOSEN "
    puts params[:id]
    Image.increment_counter :click_count , params[:id]
    puts Image.find(params[:id]).click_count
    puts "END ---- CHOSEN "

    puts "START --------- COLLECTING IP"
    puts request.ip
    redirect_to "/"
    puts "END ----------- COLLECTING IP"
  end
end
