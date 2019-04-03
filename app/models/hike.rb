class Hike < ApplicationRecord
  validates_presence_of :name, :vote_count

end
