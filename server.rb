require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:rumblr.sqlite3'

get '/' do
  p 'Baana'
  erb :home
end

get '/signup' do
  erb :signup
end

get '/login' do
  erb :login
end

get '/account' do
  erb :account
end

get '/logout' do
  session[:user] = nil
  p 'user has logged out'
  redirect '/'
end

require './models'
