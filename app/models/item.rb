class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost_burden
  belongs_to :place
  belongs_to :sent_day

  validates :name           ,presence: true, length: { maximum: 40 }
  validates :explain        ,presence: true
  validates :category_id    ,presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :condition_id   ,presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :cost_burden_id ,presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :place_id       ,presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :sent_day_id    ,presence: true, numericality:  { other_than: 1 , message: "can't be blank"}
  validates_format_of :price, with: /\A[0-9]+\z/
  validates_inclusion_of :price, in:300..9999999

  validates :image          ,presence: true

  belongs_to :user
  # has_one    :purchase_history

  has_one_attached :image



end
