class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :blood_type
  belongs_to_active_hash :job
  belongs_to_active_hash :member
  has_one :address
  has_one :information
  has_one :message
  belongs_to :stylist, optional: true

end
