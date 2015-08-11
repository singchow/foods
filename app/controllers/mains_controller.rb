class MainsController < ApplicationController

  def index
    puts "Start -- Getting Image"
    @image = Image.all.sample(2)
    puts "End -- Getting Image"
  end
end
