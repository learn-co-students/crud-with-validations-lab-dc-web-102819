class Song < ApplicationRecord
	validates :title, presence: true
	validates :title, uniqueness: {scope: :release_year}
	validates :released, inclusion: {in: [true, false]}
	validates :release_year, presence: true, :if => :released
	validate :release_year_in_future?

	def release_year_in_future?

		if release_year && release_year > Time.current.year
			errors.add(:release_year, "Year must be less than current year.")
		end
	end





end
