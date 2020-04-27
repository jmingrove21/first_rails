class PokemonController < ApplicationController

    def index
        @poke=Pokemon.find_by(id:1)
    end
    def volt
        @poke=Pokemon.find_by(id:1)
        @poke.hp-=2
        @poke.save
    end
    def speed
        @hp_value=params[:hp]
    
        @poke=Pokemon.find_by(id:1)
        @poke.hp-=@hp_value.to_i()
        @poke.save
    end

end
