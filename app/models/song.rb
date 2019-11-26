class Song < ApplicationRecord
    include ActiveModel::Validations
    validates :title, :artist_name, presence: true
    validates :release_year, numericality: {less_than_or_equal_to: DateTime.now.year, allow_nil: true }
    validates :artist_name, uniqueness: {scope: [:release_year, :title], message: "Cannot release the same song twice in a year"}
    validates_with SongValidator
end
