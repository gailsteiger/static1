class Category < ActiveRecord::Base
  has_many :answers

  attr_accessible :title
end
