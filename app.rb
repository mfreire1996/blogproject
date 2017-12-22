require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:example.sqlite3'

require_relative ('model/user')
require_relative ('model/profile')
require_relative ('model/post')

enable :session

get '/' do 
	erb :index
end

post '/' do 
	erb :index
end

get '/signup' do 
	erb :layout
	redirect '/'
end

post '/signup' do 
	@user = User.create(email: params[:email], password: params[:password])
	session[:id] = @user.id
	redirect '/'
end

get '/signin' do 
	erb :signin
end

post '/signin' do 
	@user = User.find_by(email: params[:email], password: params[:password])
	session[:id] = @user.id
	redirect '/'
end

get '/signout' do 
	session.clear
	redirect '/'
end

delete '/user' do
  @user = User.find_by_id(params[:id])

  if @User
    @User.destroy
  else
    halt 404, "User not found"
  end
end

