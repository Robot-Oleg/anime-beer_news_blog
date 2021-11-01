class View < ActiveRecord::Base
  validates :blogpost_id, uniqueness: { scope: :user_id }
  belongs_to :user
  belongs_to :blogpost, counter_cache: :views_count
end