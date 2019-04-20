class User < ApplicationRecord

  validates :name,
    uniqueness: true,
    presence: true,
    length: {minimum: 2, maximum: 20}
  validates :email,
    presence: true
  validates :introduction,
    length: {maximum: 50}
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def email_required?
  	false
  end

  def email_changed?
  	false
  end

  has_many :books, dependent: :destroy

  attachment :profile_image

end
