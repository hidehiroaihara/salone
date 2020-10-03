class ReservationsController < ApplicationController
  def index
   @stylists = Stylist.all
  end
end
