class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :fname, presence: true
  validates :lname, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :hometown_zip, presence: true
  validates :favorite_sport, presence: true
  validates :username, presence: true

  before_create :setpoints
  
  private
    def setpoints
      self.attributes = {points: 0}
    end
end
