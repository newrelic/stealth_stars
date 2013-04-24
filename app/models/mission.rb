class Mission < ActiveRecord::Base
  attr_accessible :codename, :priority
  has_and_belongs_to_many :operatives
end
