require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

set :database, 'sqlite3:rumblr.sqlite3'

get '/' do
  p 'Baana'
  @page_title = 'chapo. - The View from Above'
  @users = User.all
  p @users
  erb :home
end

get '/signup' do
  @page_title = 'chapo. - Sign Up'
  erb :signup
end

post '/signup' do
  user = User.new(
    first_name: params['first_name'],
    last_name: params['last_name'],
    username: params['username'],
    email: params['email'],
    password: params['password']
  )
  user.save
  redirect '/'
end

get '/login' do
  @page_title = 'chapo. - Log In'
  erb :login
end

post '/login' do
  email = params['email']
  given_password = params['password']
  user = User.find_by(email: email)
  if user.password == given_password
    session[:user] = user
    redirect :account
  else
    p "That's the wrong hat..."
    redirect '/'
  end
end

get '/account' do
  @page_title = "chapo. - #{session[:user].username}"
  erb :account
end

get '/logout' do
  session[:user] = nil
  p 'user has logged out'
  redirect '/'
end

#
# post '/deleteaccount' do
#   User.find(session[:user].id).destroy
#   p "USER #{session[:user].first_name} DELETED"
#   session[:user] = nil
#   redirect '/'
# end

require './models'
