require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  before do
    @game = Game.instance
  end

  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    rob = Player.new(params[:player_1_name])
    ben = Player.new(params[:player_2_name])
    @game = Game.create(rob, ben)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/hit_p2' do
    @game.attack
    redirect '/play' unless @game.game_over?
    redirect '/game_over'
  end

  get '/game_over' do
    erb :game_over
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
