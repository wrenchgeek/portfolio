class HomeController < ApplicationController

  def index
    @references = Reference.all
  end
end
