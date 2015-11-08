class Lead < ActiveRecord::Base
  validates :name, presence: true
end
