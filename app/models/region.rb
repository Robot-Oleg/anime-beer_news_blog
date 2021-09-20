class Region < ActiveRecord::Base
  belongs_to :blogpost
  validates uniqueness: { scope: :name}
end