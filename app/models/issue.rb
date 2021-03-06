class Issue < ActiveRecord::Base
  validates_length_of :title, :in => 5..105, :allow_nil => false

  has_many :votes

  def self.recent
    order { created_at.desc }
  end

  def self.popular
    where { votes_count != nil }.order { votes_count.desc }
  end

  def self.maintenence
    tag(:maintenence)
  end

  def self.transportation
    tag(:transportation)
  end

  def self.other
    tag(:other)
  end

  def self.tag(tag)
    where(tag: tag.to_str)
  end

end
