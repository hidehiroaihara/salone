class StylistStylistDetail

  include ActiveModel::Model
  attr_accessor :stylist_first_name, :stylist_last_name, :stylist_first_name_cana, :stylist_last_name_cana, :rank_id, :gender_id, :catchphrase, :self_introduction, :stylist_number, :rank_text, :stylist_history_id, :nomination_id, :nomination_price, :style_type_id, :style_technique, :hobby, :stylist_id, :image, :portraits

  def save
    stylist = Stylist.create(stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name, stylist_first_name_cana: stylist_first_name_cana, stylist_last_name_cana: stylist_last_name_cana, rank_id: rank_id, gender_id: gender_id, catchphrase: catchphrase, self_introduction: self_introduction, stylist_number: stylist_number, image: image, portraits: portraits)
    StylistDetail.create(rank_text: rank_text, stylist_history_id: stylist_history_id, nomination_id: nomination_id, nomination_price: nomination_price, style_type_id: style_type_id, style_technique: style_technique, hobby: hobby, stylist_id: stylist.id)
  end
  
    # delegate :persisted?, to: :stylist_stylist_detail
  
    # def initialize(attributes = nil, stylist_stylist_detail: StylistStylistDetail.new)
    #   @stylist_stylist_detail = stylist_stylist_detail
    #   attributes ||= default_attributes
    #   super(attributes)
    # end

    def save_update(stylist_id)
      # return if invalid?
      stylist = Stylist.find(stylist_id)
      stylistdetail = stylist.stylist_detail
      # ActiveRecord::Base.transaction do
        # rank = split_stylist_detail.map {
        #    |rank_text| StylistDetail.find_or_create_by!(rank_text: rank_text) }
        stylist.update(stylist_first_name: stylist_first_name, stylist_last_name: stylist_last_name, stylist_first_name_cana: stylist_first_name_cana, stylist_last_name_cana: stylist_last_name_cana, rank_id: rank_id, gender_id: gender_id, catchphrase: catchphrase, self_introduction: self_introduction, stylist_number: stylist_number, image: image, portraits: portraits)
        stylistdetail.update(rank_text: rank_text, stylist_history_id: stylist_history_id, nomination_id: nomination_id, nomination_price: nomination_price, style_type_id: style_type_id, style_technique: style_technique, hobby: hobby)
      # end
      # rescue ActiveRecord::RecordInvalid
      #   false
    end
    
    def stylist_destroy(stylist_id)
      stylist = Stylist.find(stylist_id)
      stylistdetail = stylist.stylist_detail
      stylist.destroy
      stylistdetail.destroy
    end
    # def to_model
    #   stylist_stylist_detail
    # end

    # attr_reader :stylist_stylist_detail

    # def default_attributes
    #   {
    #     stylist_first_name: stylist_stylist_detail.stylist_first_name,
    #     stylist_last_name: stylist_stylist_detail.stylist_last_name,
    #     stylist_first_name_cana: stylist_stylist_detail.stylist_first_name_cana,
    #     stylist_last_name_cana: stylist_stylist_detail.stylist_last_name_cana,
    #     rank_id: stylist_stylist_detail.rank_id,
    #     gender_id: stylist_stylist_detail.gender_id,
    #     catchphrase: stylist_stylist_detail.catchphrase,
    #     self_introduction: stylist_stylist_detail.self_introduction,
    #     stylist_number: stylist_stylist_detail.stylist_number,
    #     images: stylist_stylist_detail.images,
    #     rank_text: stylist_stylist_detail.stylist_detail.rank_text,
    #     stylist_history_id: stylist_stylist_detail.stylist_detail.stylist_history_id,
    #     nomination_id: stylist_stylist_detail.stylist_detail.nomination_id,
    #     nomination_price: stylist_stylist_detail.stylist_detail.nomination_price,
    #     style_type_id: stylist_stylist_detail.stylist_detail.style_type_id,
    #     style_technique: stylist_stylist_detail.stylist_detail.style_technique,
    #     stylist_history_id: stylist_stylist_detail.stylist_detail.stylist_history_id,
    #     hobby: stylist_stylist_detail.stylist_detail.hobby,
    #     stylist_id: stylist_stylist_detail.stylist_detail.stylist_id
    #   }
    # end

    # def split_tag_names
    #   tag_names.split(',')
    # end
  
end 