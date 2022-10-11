class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates_format_of :password, with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :name_last
    validates :name_first
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ一ー]+\z/ } do
    validates :name_kana_last
    validates :name_kana_first
  end

  validates :birthday, presence: true

  has_many :items
  # has_many :purchase_histories
end
