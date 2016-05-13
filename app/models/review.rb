class Review < ActiveRecord::Base
  belongs_to :doc
  belongs_to :usr
end
