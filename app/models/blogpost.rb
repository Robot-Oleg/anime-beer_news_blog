class Blogpost < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true

  searchkick word_start: [:title, :desription]

  def search_data
    {
      title: title,
      desription: desription
    }
  end
  acts_as_commontable
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :ratings
  has_one :category
  has_one :region
  has_one_attached :main_image
  has_many :views
  has_many :blogposts, through: :views
  acts_as_taggable_on :tags
  enum status: { unactive: 0, active: 1, published: 2, archived: 3 }
  enum mask: {  all_can_see: 0,
                only_title_and_description: 1,
                only_title: 2,
                hide_from_unregistered: 3 }
end