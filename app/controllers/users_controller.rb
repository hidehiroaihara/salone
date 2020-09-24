class UsersController < ApplicationController
  def index
    @search_params = user_search_params
    @users = User.search(@search_params).include(:stylist)#menu
  end

  def new
  end

  def create
  end

  def search
    @search_params = user_search_params
    @users = User.search(@search_params).include(:stylist)#menu
  end

  private

  def user_search_params
    params.fetch(:search, {}).permit(:first_name, :last_name, :first_name_cana, :last_name_cana, :phone_number,:email, :customer_number, :member_id, :visit_form, :visit_to, :visit_time, :birthday_form, :birthday_to, :age, :gender_id, :job_id, :stylist_id)
  end
end