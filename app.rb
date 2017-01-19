require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])

    redirect '/play'
  end

  get '/play' do
    # @last_action = session[:last_action] ? session[:last_action] : nil
    erb :play
    # session[:last_action] = nil
  end


  post '/hit_p2' do
    $player_2.points -= 10
    session[:last_action] = "#{$player_1.name} is attacking"
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
