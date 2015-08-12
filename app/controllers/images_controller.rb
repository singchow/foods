class ImagesController < ApplicationController
  def chosen
    puts "START ---- CHOSEN "
    puts params[:id]
    Image.increment_counter :click_count , params[:id]
    @selected = Image.find(params[:id])
    puts @selected.click_count

    if(session.has_key?("selected_images"))
      puts "adding selected images"
      session[:selected_images] += "," + @selected.id.to_s
      puts session[:selected_images]
    else
      puts "creating selected images"
      session[:selected_images] = @selected.id.to_s
      puts session[:selected_images]
    end

    puts "END ---- CHOSEN "

    redirect_to "/"
  end
end
