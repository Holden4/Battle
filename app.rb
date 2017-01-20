require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    rob = Player.new(params[:player_1_name])
    ben = Player.new(params[:player_2_name])
    $game = Game.new(rob, ben)

    redirect '/play'
  end

  get '/play' do
    # @last_action = session[:last_action] ? session[:last_action] : nil
    erb :play
    # session[:last_action] = nil
  end


  post '/hit_p2' do
    session[:last_action] = "#{$game.player_1.name} is attacking"
    $game.attack
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
