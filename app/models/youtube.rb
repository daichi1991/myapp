class Youtube < ApplicationRecord

  belongs_to :artist

  has_many :follows

end
