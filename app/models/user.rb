class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :email, presence: true
  validates :nickname, presence: true
  validates :password, presence: true

  acts_as_commontator
  enum role: { admin: 0, editor: 1, writer: 2, regular_user: 3 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogposts
  has_many :comments
  has_one_attached :avatar
  has_many :views
  has_many :blogposts, through: :views
end