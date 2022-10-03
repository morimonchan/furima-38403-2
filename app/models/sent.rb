class Sent < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place

  validates :code                , presence: true             
  validates  :place_id  , presence: true, numericality: { other_than: 1, message: "can't be blank" }             
  validates :city                 , presence: true             
  validates :street_address       , presence: true             
  validates :building                                   
  validates :phone_number       , presence: true             
  
  belongs_to :purchase_history


end
