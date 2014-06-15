require "sinatra"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "flashcard"
	)

class Deck < ActiveRecord::Base
	has_many :flashcards, dependent: :destroy
end

class Flashcard < ActiveRecord::Base
end

get "/" do
	@decks = Deck.all
	erb :index
end

get "/decks/:id" do
	@deck = Deck.find(params[:id])
	@flashcards = @deck.flashcard
	
	erb :show
end


