class Power < ApplicationRecord
    has_many :heropowers
    has_many :heros, through: :heropowers
    validates :description, length:{minimum:20}
end