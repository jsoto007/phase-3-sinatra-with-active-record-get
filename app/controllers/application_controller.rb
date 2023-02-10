class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    game = Game.all.order(:title)
    game.to_json(include: {reviews: { include: :user}})
  end 

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json
  end 

end
