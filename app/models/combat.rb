class Combat < ActiveRecord::Base
  belongs_to :map

  def characters= ids
    self['characters'] = ids.join(' ')
  end
  def characters
    self['characters'].split(' ').collect{|i|i.to_i}
  end
  
  def characters= ids
    self['characters'] = ids.join(' ')
  end
  def characters
    self['characters'].split(' ').collect{|i|i.to_i}
  end

end
