class State < ActiveRecord::Base
  validates :name, presence: true
  validates :abbreviation, presence: true, length: { is: 2 }
end
