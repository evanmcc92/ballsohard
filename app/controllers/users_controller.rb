class UsersController < ApplicationController
  def search
  end

  def show
  	@user = User.find(params[:id])
  	@sport = Sports.find(@user.favorite_sport).name
  	@title = "#{@user.username}'s Profile - "
  	@description = "#{@user.username}'s profile on BallSoHard. Bio: '#{@user.bio}'"
  end
end