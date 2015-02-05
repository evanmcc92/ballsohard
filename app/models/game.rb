class Game < ActiveRecord::Base
  belongs_to :user
  has_many :sport

  validates :venue, presence: true
end
