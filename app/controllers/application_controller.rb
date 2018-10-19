class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect '/recipes'
  end

  get '/recipes/new' do
    erb :'recipes/new'
  end

  # get '/recipes' do
  #   erb :
  # end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    erb :recipes
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    erb :'recipes/:id/delete'
  end

  get '/recipes/:id/edit' do
      @recipe = Recipe.find_by_id(params[:id])
      erb :'recipes/edit'
  end

  post '/recipes/:id/edit' do

  end


end
