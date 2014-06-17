require_dependency 'bnp'

class Page < ActiveRecord::Base
  include BNP
  
  validates_uniqueness_of :title
  validates_presence_of :title
  validates_presence_of :content
  
  def title=(value)
    write_attribute(:title, value)
    write_attribute(:slug, slugify(value))
  end
end
