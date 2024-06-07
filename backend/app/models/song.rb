class Song < ApplicationRecord
    has_many:responses
    has_many:boards
end
