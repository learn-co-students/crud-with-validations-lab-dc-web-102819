class SongValidator < ActiveModel::Validator

    def validate(record)
        if record.release_year == nil && record.released
            record.errors[:release_year] << "All released songs must have a release year."
        end
    end

end