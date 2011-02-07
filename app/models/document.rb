class Document < ActiveRecord::Base
  
  has_many :annotations, :class_name => 'Annotation'
  accepts_nested_attributes_for :annotations, :allow_destroy => true
  
end
