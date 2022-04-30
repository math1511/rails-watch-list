class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, presence: true, length: {
    minimum: 6,
    too_short: '%{count} characters is too short. Minimum of 6 characters.'
  }
  validates :movie_id, presence: true, uniqueness: { scope: :list_id }
end
