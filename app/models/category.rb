class Category < ActiveRecord::Base
  has_many :docs
end
