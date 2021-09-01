class Blogpost < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :tags, :ratings
  has_one :category, :region
end