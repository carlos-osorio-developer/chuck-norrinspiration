module JokesHelper
  def jokes_any
    @jokes.any? ? 'cards' : 'none'
  end
end
