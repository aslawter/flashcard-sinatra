require "sinatra"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "flashcard"
	)

class Deck < ActiveRecord::Base
	
end

get "/" do
	@decks = Deck.all
	erb :index
end



