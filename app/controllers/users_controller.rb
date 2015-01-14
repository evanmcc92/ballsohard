class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
  def search
  end

  def show
  	@user = User.find(params[:id])
  	@sport = Sports.find(@user.favorite_sport).name
  	@level = Level.where("points > #{@user.points}").first

    now = Time.now.utc.to_date
    @age = now.year - @user.birthday.year - (@user.birthday.to_date.change(:year => now.year) > now ? 1 : 0)

  	@title = "#{@user.username}'s Profile - "
  	@description = "#{@user.username}'s profile on BallSoHard. Bio: '#{@user.bio}'"
  end

  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end