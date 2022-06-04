class JokesController < ApplicationController
  def index; end

  def create
    @joke = Joke.new(joke_params)
    if @joke.save
      flash.now[:success] = 'Joke was successfully created.'
    else
      flash[:error] = 'This joke already exists.'
    end
    render_flash
  end

  private

  def joke_params
    params.require(:joke).permit(:api_id, :content)
  end
end
