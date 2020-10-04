class UserAddress

  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :first_name_cana, :last_name_cana, :email, :birthday, :phone_number, :gender_id, :stylist_id, :blood_type_id, :job_id, :customer_text, :member_id, :customer_number, :post_code, :prefecture_id, :address_all, :user_id, :information_date, :information_text, :consent
  
  

  def save
    user = User.create(first_name: first_name, last_name: last_name, first_name_cana: first_name_cana, last_name_cana: last_name_cana, email: email, birthday: birthday, phone_number: phone_number, gender_id: gender_id, stylist_id: stylist_id, blood_type_id: blood_type_id, job_id: job_id, customer_text: customer_text, customer_number: customer_number, member_id: member_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, address_all: address_all, user_id: user.id)
    Information.create(information_date: information_date, information_text: information_text, user_id: user.id)
    Message.create(consent: consent, user_id: user.id)
  end

  def save_update(user_id)
    user = User.find(user_id)
    useraddress = user.address
    userinformation = user.information
    usermessage = user.message
    user.update(first_name: first_name, last_name: last_name, first_name_cana: first_name_cana, last_name_cana: last_name_cana, email: email, birthday: birthday, phone_number: phone_number, gender_id: gender_id, stylist_id: stylist_id, blood_type_id: blood_type_id, job_id: job_id, customer_text: customer_text, customer_number: customer_number, member_id: member_id)
    useraddress.update(post_code: post_code, prefecture_id: prefecture_id, address_all: address_all)
    userinformation.update(information_date: information_date, information_text: information_text)
    usermessage.update(consent: consent)
  end
  def user_destroy(user_id)
    user = User.find(user_id)
    useraddress = user.address
    userinformation = user.information
    usermessage = user.message
    user.destroy
    useraddress.destroy
    userinformation.destroy
    usermessage.destroy
  end
end