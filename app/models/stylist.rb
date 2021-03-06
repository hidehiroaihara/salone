class Stylist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :rank

  has_many :reservations
  has_many :users
  has_one :stylist_detail
  has_one_attached :image
  has_many_attached :portraits

  def set_name
    self.stylist_first_name + self.stylist_last_name
  end

end
