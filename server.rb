require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3.rumblr.sqlite3'

get '/' do
  p 'Baana'
  erb :home
end
