class ReservationsController < ApplicationController
  def index
   
   @stylists = Stylist.all
   @wd = ["日", "月", "火", "水", "木", "金", "土"]
   @ago = params.fetch(:ago,0).to_i
   @time = Date.today - @ago   
  end

  private

  # def time
  #   @wd = ["日", "月", "火", "水", "木", "金", "土"]
  #   @time = Time.now
  #   @time_pre =@time.to_i - 1
  #   @time_next = @time.to_i + 1 
  # end
end
