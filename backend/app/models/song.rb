class Song < ApplicationRecord
    has_many :responses, :boards
end
