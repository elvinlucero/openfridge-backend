class User < ActiveRecord::Base
    has_many :saved_foods
    has_many :fridge_foods
end
