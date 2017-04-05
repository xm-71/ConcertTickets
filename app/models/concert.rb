class Concert < ActiveRecord::Base

  has_many :purchases

  belongs_to :venue
end
