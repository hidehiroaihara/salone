class Stylist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :rank

  has_many :reservations
  has_many :users
  has_one :stylist_detail


end
