class JokesController < ApplicationController
  def index
  end

  def create
    @joke = Joke.new(joke_params)    
    if @joke.save
      flash.now[:success] = "Joke was successfully created."
      render_flash
    else
      flash[:error] = 'This joke already exists.'
      render_flash
    end    
  end

  private

  def joke_params
    params.require(:joke).permit(:api_id, :content)
  end
end
