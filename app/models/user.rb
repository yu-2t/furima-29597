class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: {case_sensitive: true}
  validates :birthday, presence: true

  kana = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, format:{with: kana}, presence: true
  validates :first_name_kana, format:{with: kana}, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX

with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
  validates :first_name
  validates :last_name
end
  has_many :items
end
