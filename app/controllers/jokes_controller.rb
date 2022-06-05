class JokesController < ApplicationController
  def index
    @jokes = current_user.jokes
  end

  def create
    @joke = Joke.new(joke_params)
    if @joke.save
      Like.create(joke_id: @joke.id, user_id: current_user.id)
      flash.now[:success] = 'Joke was successfully created.'
    else
      @stored_joke = Joke.find_by(api_id: joke_params[:api_id])
      Like.create(joke_id: @stored_joke.id, user_id: current_user.id)
      flash.now[:error] = 'This joke already exists.'
    end
    render_flash
  end

  def destroy_like
    @like = Like.find_by(joke_id: params[:id], user_id: current_user.id)
    @like.destroy
    flash.now[:success] = 'Joke successfully removed from favorites.'
    render_flash
  end

  private

  def joke_params
    params.require(:joke).permit(:api_id, :content)
  end
end
