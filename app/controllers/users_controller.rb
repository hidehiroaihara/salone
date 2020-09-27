class UsersController < ApplicationController
  def index
    @search_params = user_search_params
    @users = User.search(@search_params).includes(:stylist)#menu
  end

  def new
    @user = UserAddress.new
  end

  def create
    @user = UserAddress.new(user_params)
  end
  
  private

  def user_params
    params.require(:user_address).permit(:first_name, :lasr_name, :first_name_cana, :last_name_cana, :phone_number, :email, :customer_number, :post_code, :prefecture_id, :address_all, :birthday, :gender_id, :blood_type_id, :job_id, :customer_text, :member_id, :information_date, :information_text, :visit_time, :consent).merge(stylist_id: stylist.id)
  end

  def user_search_params
    params.fetch(:search, {}).permit(:first_name, :last_name, :first_name_cana, :last_name_cana, :phone_number,:email, :customer_number, :member_id, :visit_form, :visit_to, :visit_time, :birthday_form, :birthday_to, :gender_id, :job_id, :stylist_id).merge(age_id: age_update)
  end

  def age
    if (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 >= 10 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 19
      return 1
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 20 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 29
      return 2
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 30 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 39
      return 3
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 40 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 49
      return 4
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 50 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 59
      return 5
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 60 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 69
      return 6
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 70 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 79
      return 7 
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 80 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 89
      return 8 
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 90 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 99
      return 9
    elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 100 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) <= 199
      return 10  
    end
  end

  def age_update
    users = User.all
    users.each do |user|
      user.age_id = age
      user.save
    end
  end  
end