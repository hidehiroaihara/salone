class StylistsController < ApplicationController

  def index
    @stylists = Stylist.all
  end

  def new
    @stylist = StylistStylistDetail.new
  end

  def create
    @stylist = StylistStylistDetail.new(stylist_params)
    if @stylist.save
      return redirect_to stylists_path
    else 
      render :new
    end
  end

  def edit 
    set_stylist

    @stylist_detail = StylistStylistDetail.new(stylist_stylist_detail: @stylist)
  end

  def update
    binding.pry
    set_stylist
    
    @stylist_detail = StylistStylistDetail.new(edit_stylist_params, stylist_stylist_detail: @stylist)

    if @stylist_detail.save_update(params[:id])
      redirect_to stylists_path, notice: '更新完了しました'
    else
      render :edit
    end
  end
  private

  def stylist_params
    params.require(:stylist_stylist_detail).permit(:stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_technique, :hobby, :style_type_id, :image)
  end

  def edit_stylist_params
    params.require(:stylist).permit(:stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_technique, :hobby, :style_type_id, :image)
  end
  def set_stylist
    @stylist = Stylist.find(params[:id])
  end
 
end