class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { admin: 0, editor: 1, writer: 2, regular_user: 3 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :blogposts
end