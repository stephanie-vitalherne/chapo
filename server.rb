require 'sinatra'
require 'sinatra/activerecord'
enable :sessions

set :database, 'sqlite3:rumblr.sqlite3'

get '/' do
  @page_title = 'chapo. - The View from Above'
  @users = User.all
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
    password: params['password'],
    birthday: params['birthday']
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

# get '/dashboard' do
#   @page_title = 'chapo. - The Rack'
#   @posts = Post.all
#   erb :dashbaord
# end

get '/account' do
  @page_title = "chapo. - #{session[:user].username}"
  erb :account
end

get '/post' do
  @posts = Post.all
  erb :post
end

post '/post' do
  post = Post.new(
    title: params['title'],
    image_url: params['image_url'],
    content: params['content']
  )
  post.save
  redirect '/post'
end

get '/logout' do
  session[:user] = nil
  p 'user has logged out'
  redirect '/'
end

require './models'
