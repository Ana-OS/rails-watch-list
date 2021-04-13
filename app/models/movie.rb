class Movie < ApplicationRecord
  validates :title, presence: true,  uniqueness: { case_sensitive: false }
  validates :overview, presence: true
  has_many :bookmarks
end
