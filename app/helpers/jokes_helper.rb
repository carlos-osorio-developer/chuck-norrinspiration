module JokesHelper
  def jokes_any
    @jokes.nil? || @jokes.empty? ? 'none' : 'cards'
  end
end
