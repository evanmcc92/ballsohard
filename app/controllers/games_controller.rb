class GamesController < ApplicationController
  def index
    # @games = Game.where("date > ?", Time.now).order('date ASC')
    @games = Game.all
  end

  def search
  end

  def show
    @game = Game.find(params[:id])
    @user = User.find_by_id(@game.user_id)
    @level = Level.where("points > #{@user.points}").first
    @badattributes = ['id','games_id','created_at','updated_at']
    now = Time.now.utc.to_date
    @age = now.year - @user.birthday.year - (@user.birthday.to_date.change(:year => now.year) > now ? 1 : 0)
    @players = Players.find_by(@game.id)
    @title = "#{Sports.find_by_id(@game.sport_id).name} Game at #{@game.venue} - "
    @description = "@#{@user.username} created a #{Sports.find_by_id(@game.sport_id).name} Game at #{@game.venue} on #{@game.date.to_formatted_s(:long_ordinal)}"
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(game_params)
    @game.points = 5 * @game.experience.to_i
    if @game.save
      redirect_to root_url
      flash[:notice] = "Action performed successfully"
    else
      redirect_to :back
      flash[:error] = @item.errors.full_messages.to_sentence
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @games = Game.find(params[:id])
    @games.destroy
    redirect_to root_url
  end

  private
    def game_params
      params.require(:game).permit(:venue, :city, :state, :zip, :address, :experience, :sport_id, :notes, :public, :playercount, :date, :points)
    end
end