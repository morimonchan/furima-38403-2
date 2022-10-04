class Sent < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place

  validates :code                , presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}            
  validates  :place_id  , presence: true, numericality: { other_than: 1, message: "can't be blank" }             
  validates :city                 , presence: true             
  validates :street_address       , presence: true             
  # validates :building  空欄でも可なので、対象外                                 
  validates :phone_number       , presence: true    format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}             
  
  belongs_to :purchase_history


end
