class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: { admin: 0, editor: 1, writer: 2, regular_user: 3 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :blogposts
  has_one_attached :avatar
  has_many :views
  has_many :blogposts, through: :views

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
        user = User.create(
          name: data['name'],
          nickname: Devise.friendly_token[0,10],
          email: data['email'],
          password: Devise.friendly_token[0,20]
        )
    end

    user
  end
end