require 'httparty'

class GetJoke
  include HTTParty
  base_uri 'https://api.chucknorris.io/jokes/random'
  def getter_joke
    self.class.get('/')
  end
end

class WelcomeController < ApplicationController
  def index; end

  def show
    @api_response = GetJoke.new.getter_joke
    @chuck_joke = Joke.new
    @chuck_joke.api_id = @api_response['id']
    @chuck_joke.content = @api_response['value']
  end
end
