class Game < ActiveRecord::Base
  belongs_to :user
  has_many :sport
  has_many :invitations
  has_many :players

  validates :venue, presence: true
  after_create :create_players

  private

  def create_players
    Players.create(
      games_id: self.id,
      user1: self.user_id
    )
  end
end
