class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  # A movie must have a unique title and an overview.
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  # A movie has many bookmarks
end
