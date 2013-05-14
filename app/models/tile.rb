class Tile < ActiveRecord::Base
  acts_as_fleximage
  validates_presence_of :name
  validates_length_of :name, :within => 3..20
end
