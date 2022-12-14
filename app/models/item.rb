class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost_burden
  belongs_to :place
  belongs_to :sent_day

  validates :name, presence: true, length: { maximum: 40 }
  validates :explain, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :cost_burden_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :place_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :sent_day_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates_format_of :price, with: /\A[0-9]+\z/
  validates :price, presence: true
  validates_inclusion_of :price, in: 300..9_999_999, only_integer: true

  validates :image, presence: true

  belongs_to :user
  has_one    :purchase_history

  has_one_attached :image
end
