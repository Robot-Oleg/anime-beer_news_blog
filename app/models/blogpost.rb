class Blogpost < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user
  has_many :comments
  has_many :ratings
  has_one :category
  has_one :region
  acts_as_taggable_on :tags
  enum status: { unactive: 0, active: 1, published: 2, archive: 3}

end