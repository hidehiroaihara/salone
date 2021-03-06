class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :blood_type
  belongs_to_active_hash :job
  belongs_to_active_hash :member
  belongs_to_active_hash :age
  has_one :address
  has_one :information
  has_one :message
  belongs_to :stylist, optional: true
  
  scope :search, -> (search_params) do
    return if search_params.blank?
    
    first_like(search_params[:first_name]).last_like(search_params[:last_name]).first_cana_like(search_params[:first_name_cana]).last_cana_like(search_params[:last_name_cana]).phone_like(search_params[:phone_number]).email_like(search_params[:email]).customer_number_like(search_params[:customer_number]).member_like(search_params[:menber_id]).visit_from(search_params[:visit_from]).visit_to(search_params[:visit_to]).visit_time_like(search_params[:visit_time]).birthday_from(search_params[:birthday_from]).birthday_to(search_params[:birthday_to]).age_like(search_params[:age_id]).gender_like(search_params[:gender_id]).job_like(search_params[:job_id]).stylist_like(search_params[:stylist_id])
  end

  scope :first_like, -> (first_name) { where('first_name LIKE ?', "%#{first_name}%") if first_name.present? }
  scope :last_like, -> (last_name) { where('last_name LIKE ?', "%#{last_name}%") if last_name.present? }
  scope :first_cana_like, -> (first_name_cana) { where('first_name_cana LIKE ?', "%#{first_name_cana}%") if first_name_cana.present? }
  scope :last_cana_like, -> (last_name_cana) { where('last_name_cana LIKE ?', "%#{last_name_cana}%") if last_name_cana.present? }
  scope :phone_like, -> (phone_number) { where('phone_number LIKE ?', "%#{phone_number}%") if phone_number.present? }
  scope :email_like, -> (email) { where('email LIKE ?', "%#{email}%") if email.present? }
  scope :customer_number_like, -> (customer_number) { where('customer_number LIKE ?', "%#{customer_number}%") if customer_number.present? }
  scope :member_like, -> (member_id) { where(member_id: member_id) if member_id.present? }
  scope :visit_from, -> (from) { where('? <= visit', from) if from.present? }
  scope :visit_to, -> (to) { where('visit <= ?', to) if to.present? }
  scope :visit_time_like, -> (visit_time) { where('visit_time LIKE ?', "%#{visit_time}%") if visit_time.present? }
  scope :birthday_from, -> (from) { where('? <= birthday', from) if from.present? }
  scope :birthday_to, -> (to) { where('birthday <= ?', to) if to.present? }
  scope :age_like, -> (age_id) { where(age_id: age_id) if age_id.present? } 
  scope :gender_like, -> (gender_id) { where(gender_id: gender_id) if gender_id.present? }
  scope :job_like, -> (job_id) { where(job_id: job_id) if job_id.present? }
  scope :stylist_like, -> (stylist_id) { where(stylist_id: stylist_id) if stylist_id.present? }
end
