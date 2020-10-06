class StylistsController < ApplicationController
  before_action :set_stylist, only: [:edit, :update, :destroy, :show, :update_image] 
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
    # binding.pry
    # @stylist_detail = StylistStylistDetail.new(stylist_stylist_detail: @stylist)
    @stylist_detail = StylistStylistDetail.new(stylist_first_name: @stylist.stylist_first_name, stylist_last_name: @stylist.stylist_last_name, stylist_first_name_cana: @stylist.stylist_first_name_cana, stylist_last_name_cana: @stylist.stylist_last_name_cana, rank_id: @stylist.rank_id, gender_id: @stylist.gender_id, catchphrase: @stylist.catchphrase, self_introduction: @stylist.self_introduction, stylist_number: @stylist.stylist_number, rank_text: @stylist.stylist_detail.rank_text, stylist_history_id: @stylist.stylist_detail.stylist_history_id, nomination_id: @stylist.stylist_detail.nomination_id, nomination_price: @stylist.stylist_detail.nomination_price, style_technique: @stylist.stylist_detail.style_technique, hobby: @stylist.stylist_detail.hobby, style_type_id: @stylist.stylist_detail.style_type_id, image: @stylist.image,portraits: @stylist.portraits )

  end

  def update
    # @stylist.images.detach #一旦、すべてのimageの紐つけを解除
    @stylist_detail = StylistStylistDetail.new(stylist_params)
    # binding.pry
    if @stylist_detail.save_update(params[:id])
      redirect_to stylists_path, notice: '更新完了しました'
    else
      render :edit
    end
  end
  
  # def upload_image
  #   @image_blob = create_blob(params[:image])
  #   respond_to do |format|
  #     format.json { @image_blob.id }
  #   end
  # end

  def destroy
    @stylist_detail = StylistStylistDetail.new
     if @stylist_detail.stylist_destroy(params[:id])
      redirect_to root_path
     else
      render :show
     end
  end
  private

  def stylist_params
    params.require(:stylist_stylist_detail).permit(:stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_technique, :hobby, :style_type_id,:image , portraits: [])
    # .merge(images: uploaded_images)
  end

  # def stylist_params
  #   params.require(:stylist_stylist_detail).permit(:stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_technique, :hobby, :style_type_id,:image , portraits: [])
    # .merge(images: uploaded_images)
  # end

  # def edit_stylist_params
  #   params.require(:stylist_stylist_detail).permit(:stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_technique, :hobby, :style_type_id, images: [])
  # end

  # def upload_images
  #   params[:stylist_stylist_detail][:images].map{|id| ActiveStorage::Blob.find(id)} if params[:stylist_stylist_detail][:images]
  # end

  def set_stylist
    @stylist = Stylist.find(params[:id])
  end
  # def create_biob(uploading_file)
  #   ActiveStorage::Blob.create_after_upload! \
  #     io: uploading_file.open,
  #     filename: uploading_file.original_filename,
  #     content_type: uploading_file.content_type
  # end
end