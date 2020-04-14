class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
  	@figures = Figure.all

  	erb :'/figures/index'
  end

  get '/figures/new' do
  	@figures = Figure.all
  	@titles = Title.all
  	@landmarks = Landmark.all

  	erb :'figures/new'
  end

  get '/figures/:slug' do
  	@figure = Figure.find_by_slug(params[:slug])

  	erb :'/figures/show'
  end

  get '/figures/:slug/edit' do
  	@figure = Figure.find_by_slug(params[:slug])
  	@titles = Title.all
  	@landmarks = Landmark.all

  	erb :'/figures/edit'
  end

  patch '/figures/:slug' do
  	figure = Figure.find_by_slug(params[:slug])
  	figure.update(params[:figure])

  	figure.titles.create(params[:title]) if !params[:title][:name].empty?
  	figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty?

  	redirect "/figures/#{figure.slug}"
  end

  post '/figures' do
  	figure = Figure.create(params[:figure])

  	figure.titles.create(params[:title]) if !params[:title][:name].empty?

  	figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty?

  	redirect "/figures/#{figure.slug}"
  end

end
