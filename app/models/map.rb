class Map < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :within => 3..20
  has_many :characters, :dependent => :nullify
  has_many :combats, :dependent => :destroy
  def matrix
    @matrix ||= self['matrix'] ?
      self['matrix'].split("\n").collect!{|l|l.split(' ').collect!{|i|i.to_i}} :
      height.times.collect{[0]*width}
  end
  
  def matrix=(m)
    @matrix = nil
    self['matrix'] = m.collect{|l|l.join(" ")}.join("\n")
  end

  def before_save
    m = self.matrix
    self.matrix= m
  end
end
