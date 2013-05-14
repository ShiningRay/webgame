class Character < ActiveRecord::Base
  belongs_to :user
  belongs_to :map
  validates_presence_of :name
#  validates_uniqueness_of :name
  validates_length_of :name, :within => 3..20
  serialize :inventory
  serialize :skills

#  def initialize(params=nil)
#    super
#    self.skills ||= {}
#    self.inventory ||= {}
#  end
end
