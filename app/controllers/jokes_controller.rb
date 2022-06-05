class JokesController < ApplicationController
  def index
    @jokes = current_user.jokes
  end

  def create
    @joke = Joke.new(joke_params)
    if @joke.save
      add_like(@joke)      
    else
      @stored_joke = Joke.find_by(api_id: joke_params[:api_id])
      add_like(@stored_joke)      
    end    
  end

  def add_like(joke)
    @like = Like.new(joke_id: joke.id, user_id: current_user.id)
    if @like.save
      flash.now[:success] = t('msgs.joke_added')
    else
      flash.now[:error] = t('msgs.duplicate_joke')
    end
    render_flash
  end

  def destroy_like
    @like = Like.find_by(joke_id: params[:id], user_id: current_user.id)
    @like.destroy
    flash.now[:success] = t('msgs.delete_joke')
    render_flash
  end

  private

  def joke_params
    params.require(:joke).permit(:api_id, :content)
  end
end
