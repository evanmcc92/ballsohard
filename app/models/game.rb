class Game < ActiveRecord::Base
  belongs_to :user
  has_many :sport
  has_many :invitations
  has_many :players

  validates :venue, presence: true
  after_create :create_feed

  private

  def create_players
    Player.create(
      game_id: self,
      user1: self.user_id
    )
  end
end
