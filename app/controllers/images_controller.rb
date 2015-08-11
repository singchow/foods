class ImagesController < ApplicationController
  def chosen
    puts "START ---- CHOSEN "
    puts params[:id]
    Image.increment_counter :click_count , params[:id]
    puts Image.find(params[:id]).click_count
    puts "END ---- CHOSEN "
    redirect_to "/"
  end
end
