class Venue < ActiveRecord::Base
  belongs_to :region
  validates_uniqueness_of :name
  validates :full_address, presence: true


end
