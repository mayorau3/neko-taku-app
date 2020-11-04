class CatsController < ApplicationController

  def new
    @cat = Cat.new
  end
  
end
