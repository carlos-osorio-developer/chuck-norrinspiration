class JokesController < ApplicationController
  def index
  end

  def create
    @joke = Joke.new(joke_params)
    respond_to do |format|
      if @joke.save
        flash[:notice] = "Joke was successfully created."
      else
        flash[:error] = 'Joke was not created.'
      end
    end
  end

  private

  def joke_params
    params.require(:joke).permit(:api_id, :content)
  end
end
