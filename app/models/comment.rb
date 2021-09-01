class Comment < ActiveRecord::Base
  belongs_to :user, :blogpost
end