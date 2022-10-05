class PurchaseHistorySent


  include ActiveModel::Model
  attr_accessor :code, :place_id, :city, :street_address, :building, :phone_number, :user_id, :item_id


  with_options presence: true do
  validates :code                , format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}            
  validates :city               
  validates :street_address              
  validates :user_id
  validates :item_id
  validates :phone_number       ,    format: {with: /\A\d{10,11}\z/, message: "is invalid. Include hyphen(-)"}  

  end
  validates  :place_id  , numericality: { other_than: 1, message: "can't be blank" }             

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Sent.create(code: code, place_id: place_id, city: city, street_address: street_address, building: building, phone_number: phone_number, purchase_history_id: purchase_history.id)

  end



end

  
