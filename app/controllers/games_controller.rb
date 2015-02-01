class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def search
  end

  def show
    @game = Game.find(params[:id])
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

  private
    def game_params
      params.require(:game).permit(:venue, :city, :state, :zip, :address, :experience, :sport_id, :notes, :public, :playercount, :date, :points)
    end
end