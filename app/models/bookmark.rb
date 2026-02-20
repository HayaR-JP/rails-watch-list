class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  # The comment of a bookmark cannot be shorter than 6 characters.
  validates :movie_id, uniqueness: { scope: [ :movie_id, :list_id ] }
  validates :comment, presence: true, length: { minimum: 6 }
  # You can’t delete a movie if it is referenced in at least one bookmark.

end
