class StylistsController < ApplicationController
  def index
    @Stylists = Stylist.all
  end

  def new
    @stylist = Stylist.new
  end
end
